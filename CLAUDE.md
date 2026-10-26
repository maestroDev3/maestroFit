# maestroFit

Persönliche Trainings-App für Krafttraining/Bodybuilding: Übungen nachschlagen,
beanspruchte Muskeln visualisieren (interaktive Body-Map), Bewegungsausführung
sehen, eigenes Training schnell eintragen und auswerten. Keine Bezahlkurse im
Kern; Grundfunktionen bleiben frei.

## Technik-Entscheidungen (2026-10-26)

- **Plattform:** Flutter/Dart. Android zuerst, iOS später (eigenes Epic, wenn dran).
- **Sprache:** App zweisprachig Deutsch + Englisch (Flutter-Lokalisierung von
  Anfang an, `intl`/ARB). Issues und Doku auf Deutsch.
- **Daten:** Lokal auf dem Gerät (Drift/SQLite), kein Konto, kein Server.
  Export/Backup (CSV/JSON) ist fester Bestandteil. Cloud-Sync: bewusst nicht jetzt.
- **Stack:** Drift (DB) · Riverpod 3 (State) · go_router (Navigation) ·
  flutter_svg + Body-Map (flutter_body_atlas oder eigener CustomPainter) ·
  Rive/Lottie (Animationen) · fl_chart (Statistiken) · freezed (Modelle).
- **Übungsdaten:** free-exercise-db (Public Domain) als gebündelter Offline-Seed;
  Mapping-Tabelle Datenbank-Muskel → SVG-Muskel-ID. Übernahmen aus wger nur mit
  Lizenzfeldern (`license`, `license_author`). Credits-Screen ist Pflicht
  (CC-BY-Attribution der Body-Map-Grafiken). Keine Medien von MuscleWiki/ExerciseDB
  ohne Lizenz; kein AGPL-Code übernehmen (wger-App nur als Architektur-Inspiration).
- **Verteilung:** Signierte APK über GitHub Releases (kein Play Store vorerst;
  Einrichtung später möglich). Min-Android 8.0 (API 26).
- **App-ID:** provisorisch `de.maestrodev.maestrofit`; finale Entscheidung vor dem
  ersten öffentlichen Release (steht in STAND.md unter „Offene Entscheidungen“).
- **Fehlerberichte:** Nur lokal (Log auf dem Gerät, in den Einstellungen einsehbar
  und exportierbar). Kein Crash-Reporting-Dienst – keine Daten verlassen das Handy.
- **Konventionen & Definition of Done:** `.claude/skills/flutter-dart/SKILL.md`
  (bei jedem Task lesen und befolgen).

## Arbeitsmodus (2026-10-26, vom Nutzer bestätigt)

Der Agent arbeitet **voll autonom je Story**:

1. Nächste Story laut Reihenfolge im Epic (bzw. Vorgabe des Nutzers) von `backlog`
   auf `ready` verfeinern: volle Vorlage, Akzeptanzkriterien, Tasks als Sub-Issues.
2. Story auf `in-progress` setzen (immer nur eine) und Tasks nacheinander umsetzen:
   je Task ein Branch + PR nach TDD, mergen gemäß Abschnitt „Mergen“.
3. Wenn alle Tasks gemergt sind: Smoke-Test prüfen, APK bereitstellen und den
   Nutzer zum Testen der Akzeptanzkriterien auffordern. **Die Story schließt der
   Nutzer** (bzw. der Agent nach dessen ausdrücklichem Test-OK).
4. `STAND.md` bei jeder Statusänderung aktualisieren; danach ohne Rückfrage mit
   der nächsten Story laut Reihenfolge weitermachen.

Rückfragen nur bei Entscheidungen, die nicht rückgängig zu machen sind oder die
Produktrichtung betreffen; sonst beste Annahme treffen und in der Story unter
„Entscheidungen“ dokumentieren.

## Struktur: Initiative → Epic → Story → Task

Alles lebt in GitHub-Issues, verknüpft über Sub-Issues:

| Ebene | Label | Inhalt |
|---|---|---|
| Initiative | `initiative` | Langlebiges Oberthema; Epics als Sub-Issues |
| Epic | `epic` | Endliches Vorhaben; Stories als Sub-Issues, Reihenfolge in der Beschreibung |
| Story | `story` | Für den Nutzer sichtbares Feature; Tasks als Sub-Issues |
| Task | `task` | Genau ein PR, TDD, testbare Akzeptanzkriterien |

Status einer Story (Label, genau eins; erledigt = geschlossen):
- `backlog` – Idee, grob beschrieben, noch keine Tasks
- `ready` – verfeinert, Tasks mit Akzeptanzkriterien stehen
- `in-progress` – wird gerade umgesetzt (immer nur eine Story gleichzeitig)

Regeln:
- Tasks werden erst geschrieben, wenn eine Story von `backlog` nach `ready` wechselt.
- Welche Story als Nächstes umgesetzt wird, entscheidet der Mensch; ohne Vorgabe die
  nächste `ready`-Story laut Reihenfolge im Epic.

## Initiativen und Epics: Konvention

Ein Epic ist ein **endliches Vorhaben**, dauerhafte Themen liegen eine Ebene darüber
(Initiativen) – so wie bei Jira, Azure DevOps, Linear und SAFe.

**Initiativen** (Label `initiative`)
- Langlebiges Oberthema mit Zielbild: Warum, Nutzen, Gehört dazu / nicht dazu, Epics,
  „Fertig, wenn“ (1–3 grobe Aussagen). Kein Status-Label, keine Reihenfolge, kein
  Fortschrittswert (der GitHub-Balken zählt nur direkte Kinder und wird ignoriert).
- Ohne offene Epics **ruht** eine Initiative und bleibt offen (Stand: „Ruht“).
- **Nur der Mensch schließt Initiativen.** Der Agent schlägt es vor, wenn alle Epics zu
  sind und „Fertig, wenn“ erfüllt ist. Beim Schließen: ein Satz zu Ergebnis oder Grund.
- Folgearbeit zu einer geschlossenen Initiative = **neue** Initiative mit eigenem,
  ergebnisbezogenem Titel (kein „v2“) und „Bezug: #alt“.

**Epics** (Label `epic`)
- **Endlich.** Ergebnisbezogener Titel, nie „… II“ oder Nummern. Geschlossen, sobald
  alle Stories geschlossen sind; im Abschlusskommentar ggf. Folge-Epics.
- **Genau eine Initiative als Parent**, gewählt nach dem Hauptnutzen. Passt ein Epic
  auch zu einer zweiten, steht dort „Siehe auch: #nr“. Geschlossene Epics dürfen an
  eine offene Initiative gehängt werden – das ist kein Wiederöffnen.

**Für alle Ebenen**
- **Geschlossen bleibt geschlossen.** Der Agent öffnet **nie** ein geschlossenes Issue
  wieder – weder Initiative, Epic, Story noch Task. Neue Arbeit zu etwas Erledigtem
  wird ein **neues** Issue mit „Bezug: #nr“.
- **Keine Waisen:** jede Story hat genau ein Epic, jedes Epic genau eine Initiative.
- **Neue Idee:** `backlog`-Story in einem offenen Epic, das genau dieses Ziel verfolgt
  → sonst neues Epic in der passenden offenen Initiative → sonst neue Initiative.
  Der Agent legt sofort an (keine Rückfrage, um nicht zu blockieren) und trägt alles,
  was oberhalb einer Story neu ist, in `STAND.md` unter „Offene Entscheidungen“ ein
  („neu angelegt – bitte bestätigen oder umsortieren“).

## Issue-Vorlagen (Jira-Stil)

Jedes Issue sagt, **wofür** es da ist, **welchen Nutzen** es hat und **wann es fertig**
ist. Vorlagen: `.github/ISSUE_TEMPLATE/` (Initiative, Epic, Story, Task) – der Agent
schreibt Issues per API immer nach dieser Gliederung.

- **Story:** Ziel als „Als Nutzer möchte ich …, damit …“, Nutzen, Nicht-Umfang,
  **Akzeptanzkriterien aus Nutzersicht** (beim Test der App prüfbar), Entscheidungen, Tasks.
- **Task:** Zweck (welches Story-Kriterium), Umsetzung, **technische
  Akzeptanzkriterien – jedes wird genau ein Test**, Abhängig von. Definition of Done
  per Verweis, nicht kopiert.
- **Epic:** Ergebnis, Nutzen, Umfang/Nicht-Umfang, Stories (Reihenfolge),
  „Fertig, wenn“ als Verweiszeile auf die Merge-Regeln.
- Kein Gherkin (bei TDD sind die Tests die Given/When/Then-Form); bei Verhalten
  „Wenn …, dann …“.
- **Nachziehen:** Backlog-Stories bekommen die volle Vorlage beim Wechsel nach
  `ready`. Geschlossene Issues werden nie angepasst.

## Mergen

- Jeder Task wird in genau einem PR umgesetzt (Branch `task/<issue-nr>-kurztitel`),
  TDD: Test zuerst, dann Umsetzung.
- Gemergt wird nur, wenn die CI grün ist (`flutter analyze` + `flutter test`) und
  jedes technische Akzeptanzkriterium des Tasks durch genau einen Test belegt ist.
- Squash-Merge; Head-Branch danach löschen.
- Eine Story wird geschlossen, wenn alle Tasks gemergt sind, der Smoke-Test grün ist
  und der Nutzer die Akzeptanzkriterien in der App geprüft hat.
- Ein Epic wird geschlossen, sobald alle Stories geschlossen sind.

## Stand pflegen (`STAND.md`)

Kurzfassung des Projektstands, die der Mensch als Kontext liest; muss immer zu den
Issues passen.

- Aktualisieren, sobald sich etwas ändert: Story wechselt den Status oder wird
  geschlossen, neue Story, neues Epic oder neue Initiative, Reihenfolge ändert sich,
  Entscheidung getroffen.
- Inhalt: In Arbeit · Als Nächstes · Backlog nach Initiative → Epic (offene Epics mit
  „x von y Stories zu“, ruhende Initiativen unter „Ruht“) · Zuletzt erledigt
  (höchstens 5, neueste oben) · Offene Entscheidungen · Datum „Zuletzt aktualisiert“.
- Kurz halten: Nummer + Titel, keine Task-Details.
