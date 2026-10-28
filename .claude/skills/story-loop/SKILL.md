---
name: story-loop
description: Arbeits-Runbook für die autonome Umsetzung von maestroFit-Stories – Umgebungs-Besonderheiten, Story-Zyklus, CI-Abläufe. Bei Session-Start und vor jeder Story lesen.
---

# Story-Loop: Runbook für autonome Sessions

Regeln/Hierarchie: `CLAUDE.md` · Technik/Datenmodell: `ARCHITEKTUR.md` ·
Code-Konventionen/DoD: `.claude/skills/flutter-dart/SKILL.md` · Produkt/Meilensteine:
`PROJEKT.md` · Kurzstatus: `STAND.md`.

## 1. Umgebungs-Besonderheiten (hart erarbeitet – nicht neu austesten)

- **Kein lokales Flutter, und keins installierbar**: storage.googleapis.com,
  pub.dev, dl.google.com sind aus der Agent-Umgebung gesperrt. **Die CI ist die
  einzige Build- und Testumgebung.** Code wird „blind“ geschrieben und per PR
  verifiziert.
- **GitHub nur per REST**: GraphQL ist gesperrt → `gh api repos/...` nutzen;
  `gh label`, `gh run watch` teils betroffen. Sub-Issues:
  `gh api repos/maestroDev3/maestroFit/issues/<nr>/sub_issues` (POST mit
  `-F sub_issue_id=<issue-ID, nicht Nummer>`).
- **Gesperrt** (nicht erneut versuchen): Repo-Settings-Writes, Branch löschen
  (API und git push --delete), **GitHub-Secrets lesen/schreiben** (geprüft
  2026-10-28: 403) → Secrets legt der Nutzer an, Workflows mit Fallback bauen,
  falls ein Secret fehlt. Gemergte Branches bleiben stehen, bis der Nutzer
  „Automatically delete head branches“ aktiviert.
- **Action-SHAs auflösen** ohne API-Zugriff auf fremde Repos:
  `git ls-remote https://github.com/<owner>/<repo> "refs/tags/<tag>^{}"`.
- **Kein Vordergrund-`sleep`** in Befehlen; auf CI warten mit einem
  Hintergrund-until-Loop (siehe §4).
- Default-Branch: `main`. Remote heißt offiziell `maestroDev3/maestroFit`
  (Groß-/Kleinschreibung in Meldungen egal).

## 2. Feste Workflows im Repo

| Workflow | Zweck | Auslösen |
|---|---|---|
| `ci.yml` | je PR/main: pub get --enforce-lockfile → Codegen → analyze → test (-x screenshots) → Screenshots-Artefakt → Debug-APK-Artefakt | automatisch |
| `maintenance.yml` | erzeugt `pubspec.lock` + `.fvmrc` auf dem Runner und committet auf einen Branch – **nach jeder pubspec-Änderung Pflicht**, sonst scheitert enforce-lockfile | `gh api .../actions/workflows/maintenance.yml/dispatches -f ref=main -f 'inputs[branch]=<task-branch>'` |
| `test-apk.yml` | baut APK und erstellt Pre-Release (bis #39/#40: Debug-Signatur) | dispatch mit `inputs[tag]=vX.Y.Z-mN` |
| `nightly.yml` | integration_test auf dem Emulator | nightly + dispatch |

Flutter-Version ist überall exakt gepinnt (`.fvmrc` + `flutter-version:` in den
Workflows, aktuell 3.47.8) – bei Upgrade beides synchron ändern (maintenance
liefert die neue Version). Generierte Dateien (`*.g.dart`, `*.freezed.dart`,
Goldens) werden nie eingecheckt; die CI generiert sie.

## 3. Der Story-Zyklus

1. **Story wählen**: nächste laut `STAND.md` „Als Nächstes“ (bzw. Nutzer-Vorgabe).
2. **Verfeinern auf `ready`**: volle Vorlage (PATCH Body), Tasks als eigene
   Issues (Label `task`) anlegen und als Sub-Issues anhängen; Reihenfolge und
   „Abhängig von“ setzen. Dann Label `ready` → sofort `in-progress`
   (immer nur eine Story).
3. **Je Task**: Branch `task/<nr>-kurz` von aktuellem main → Test(s) zuerst
   (Commit), dann Umsetzung (Commit) → push → bei pubspec-Änderung maintenance
   auf den Branch → PR mit `Closes #<tasknr>`, AK-Checkliste, Attribution →
   CI abwarten (§4) → bei Rot: Log lesen (§5), fixen → bei Grün:
   `gh api -X PUT .../pulls/<pr>/merge -f merge_method=squash`.
4. **Story abschließen** (Modus „gebündelt je Meilenstein“, 2026-10-28):
   Smoke grün + **Screenshots-Artefakt ansehen** (herunterladen, Read auf die
   PNGs – Layout plausibel?) → AK-Checkboxen abhaken (PATCH Body),
   Abschlusskommentar mit PR-Links → Issue schließen (state_reason=completed).
   Nur Stories mit echtem Nutzerinput-Bedarf bleiben `awaiting-test`.
5. **STAND.md** aktualisieren (jede Statusänderung), committen auf main
   (Doku-Ausnahme), pushen. Weiter mit der nächsten Story – ohne Rückfrage.
6. **Meilenstein fertig** (alle Stories zu): `test-apk.yml` mit Tag
   `v0.<M>.0` dispatchen → Release-Link + Testpunkte an den Nutzer melden →
   GitHub-Milestone schließen. Fehler aus dem Nutzertest werden `bug`-Issues
   am passenden Epic (siehe CLAUDE.md).

## 4. Auf einen CI-Lauf warten (Muster)

```bash
# Hintergrund-Befehl (run_in_background), timeout großzügig:
until RUN=$(gh api "repos/maestroDev3/maestroFit/actions/runs?branch=<branch>&event=pull_request&per_page=1" --jq '.workflow_runs[0].id' 2>/dev/null) \
  && [ -n "$RUN" ] \
  && ST=$(gh api "repos/maestroDev3/maestroFit/actions/runs/$RUN" --jq 'select(.status=="completed") | .conclusion' 2>/dev/null) \
  && [ -n "$ST" ]; do sleep 25; done; echo "RUN=$RUN CONCLUSION=$ST"
```
Für dispatches: gleiche Schleife über `.../workflows/<datei>/runs?per_page=1`
(darauf achten, nicht einen alten abgeschlossenen Lauf zu erwischen – Lauf-ID
mit vorheriger vergleichen).

## 5. Rote CI debuggen

- Jobs/Schritte: `gh api repos/.../actions/runs/<id>/jobs --jq '.jobs[].steps[] | select(.conclusion=="failure") | .name'`
- Log: `gh run view <id> --log-failed` (falls blockiert:
  `gh api repos/.../actions/runs/<id>/logs` lädt ein Zip; nach Download:
  grep die relevanten Schritte). Immer erst Logs lesen, dann fixen – nie raten.
- Artefakte (Screenshots/APK) auflisten: `gh api repos/.../actions/runs/<id>/artifacts`;
  Download-URL per `archive_download_url` + `gh api` (folgt Redirect) in Datei.
- `pumpAndSettle` hängt bei Dauer-Animationen → gezielt `pump(duration)`.

## 6. Issue-Hygiene (Kurzfassung der CLAUDE.md-Regeln)

Geschlossen bleibt geschlossen · keine Waisen · neue Ideen sofort als
`backlog`-Story ins passende Epic und in STAND.md unter „Offene Entscheidungen“
melden · Initiativen schließt nur der Mensch · Epic-Story-Listen und
Initiative-Epic-Listen beim Anlegen/Umsortieren mitpflegen (PATCH Body).
