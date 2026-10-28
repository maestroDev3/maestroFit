# Stand

Aktueller Projektstand. Wird vom Agenten nach jeder Statusänderung gepflegt.
Maßgeblich sind die GitHub-Issues; diese Datei ist die Kurzfassung.
Produkt/Meilensteine: `PROJEKT.md` · Technik: `ARCHITEKTUR.md` · Runbook: `.claude/skills/story-loop/SKILL.md`.

**Zuletzt aktualisiert:** 2026-10-28

## In Arbeit

- – (nächste Story: #39 Signierte Release-APK, Milestone M1)

## Als Nächstes (nach GitHub-Milestones)

1. **M1 Release-Pipeline & Datenfundament** (v0.2.0): #39 → #40 → #47
2. **M2 Übungslexikon** (v0.3.0): #51 → #18 → #19 → #24 → #25
3. **M3 Body-Map** (v0.4.0): #21 → #22 → #23
4. **M4 Logger-Kern** (v0.5.0): #48 → #26 → #49 → #27 → #35
5. **M5 Logger-Komfort & Routinen** (v0.6.0): #28 → #29 → #50 → #30 → #56 → #57 → #58
6. **M6 Statistik & Politur** (v0.7.0): #31 → #32 → #33 → #34 → #54 → #36 → #14 → #16 → #17 → #20 → #52 → #53

Je Meilenstein: Test-APK als Pre-Release, Nutzer testet gebündelt, Fehler → `bug`-Issues.

## Backlog nach Initiative → Epic

**#1 Initiative: Technisches Fundament**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #6 Lauffähiges App-Gerüst | 2 von 5 zu (+#37 aufgelöst) | ~~#13~~ ~~#15~~ → #47 (M1, Enabler) → #36 (M6) → #14 (M6) |
| #7 Design-System & dynamische UI-Basis | 0 von 2 zu | #16 → #17 (M6; dunkel-first, kräftiger Akzent) |
| #38 Release & Verteilung Android | 0 von 2 zu | #39 → #40 (M1) |

**#2 Initiative: Übungslexikon mit Muskel-Visualisierung**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #8 Übungsdatenbank an Bord | 0 von 6 zu | #51 (M2, Enabler) → #18 (M2) → #19 (M2) → #52 (M6) → #53 (M6) → #20 (M6) |
| #9 Interaktive Body-Map | 0 von 3 zu | #21 → #22 (M3) → #23 (M3, nach #24) |
| #10 Übungsdetail mit Ausführung | 0 von 2 zu | #24 → #25 (M2; Credits vor der ersten Body-Map-Grafik) |

**#3 Initiative: Training erfassen & auswerten**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #11 Schneller Workout-Logger | 0 von 8 zu | #48 → #26 → #49 → #27 (M4) → #28 → #29 → #50 → #30 (M5) |
| #55 Routinen & Vorlagen | 0 von 3 zu | #56 → #57 → #58 (M5) |
| #12 Fortschritt sichtbar | 0 von 6 zu | #35 (M4) → #31 → #32 → #33 → #34 → #54 (M6) |

**Ruht**

- #4 Initiative: Intelligente Trainingsunterstützung – Epics entstehen, sobald Lexikon + Tracking stehen
- #5 Initiative: Kursangebote & Monetarisierung – bewusst geparkt

## Zuletzt erledigt

- #13 App-Gerüst mit Navigation und Theme (PRs #44–#46; geschlossen nach neuem Abnahme-Modus, Nutzertest gebündelt mit M1-APK)
- #15 CI gehärtet und vollständig (Enabler; PRs #63–#66)
- #37 Smoke-Test-Story aufgelöst (Task in #15)

## Offene Entscheidungen (nur der Mensch)

- Finale App-ID vor dem ersten öffentlichen Release festlegen (provisorisch `de.maestrodev.maestrofit`).
- Keystore-Backup bestätigen, sobald #39 die Datei + Passwörter liefert (ohne Bestätigung kein Umstieg auf Release-Signatur).
- Repo-Settings (für den Agenten gesperrt): „Automatically delete head branches" aktivieren; optional Branch-Schutz für `main`.

## Getroffene Entscheidungen (zuletzt)

- 2026-10-28: **Abnahme gebündelt je Meilenstein** – Agent schließt Stories selbst (CI + Smoke + Screenshots), Nutzer testet Meilenstein-APKs; GitHub-Milestones M1–M6 angelegt. **Design: dunkel-first, kräftiger Akzent.** **Keystore: Agent erzeugt, Nutzer sichert.** Doku konsolidiert: PROJEKT.md, ARCHITEKTUR.md (Datenmodell), Runbook-Skill `story-loop`.
- 2026-10-27: Planungs-Review umgesetzt (Reihenfolge, Issues #47–#58, awaiting-test/Enabler/Bug-Regeln, TDD „mindestens ein Test"); Body-Map als eigener CustomPainter; Lottie vor Rive.
- 2026-10-26: Verteilung per signierter APK über GitHub Releases · Fehlerberichte nur lokal · App-ID provisorisch · DE+EN · lokal mit Export.
