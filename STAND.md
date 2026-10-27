# Stand

Aktueller Projektstand. Wird vom Agenten nach jeder Statusänderung gepflegt.
Maßgeblich sind die GitHub-Issues; diese Datei ist die Kurzfassung.

**Zuletzt aktualisiert:** 2026-10-27 (nachmittags)

## In Arbeit

- – (nächste Story: #39 Signierte Release-APK)

## Wartet auf Nutzertest (`awaiting-test`)

- #13 App-Gerüst mit Hauptnavigation und Theme (Epic #6) – Test-APK `v0.1.0-story13`

## Als Nächstes

Reihenfolge nach Planungs-Review (2 unabhängige Reviews, vom Nutzer bestätigt 2026-10-27):

1. #39 Signierte Release-APK + #40 Auto-Release (Epic #38 – vorgezogen: Debug→Release-Signaturwechsel würde später Nutzerdaten löschen)
2. #47 Drift-Grundgerüst (Epic #6, Enabler)
3. #51 Seed-/Asset-Pipeline (Epic #8, Enabler) → #18 Übungsbibliothek
4. #24 Übungsdetailseite + #25 Credits-Screen (Credits vor der ersten Body-Map-Grafik!)
5. #21 Body-Map → #22 Muskel antippen
6. #48 Einheiten kg/lbs → #26 Workout loggen → #49 Abschluss → #35 Export (vorgezogen)
7. Danach: #14 Sprache, Epic #7 Design (gegen echte Screens), Rest laut Epic-Listen

## Backlog nach Initiative → Epic

**#1 Initiative: Technisches Fundament**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #6 Lauffähiges App-Gerüst | 1 von 5 zu (+#37 aufgelöst) | #13 (`awaiting-test`) → ~~#15 CI~~ (zu) → #47 Drift-Grundgerüst (Enabler) → #36 Fehler-Log → #14 Zweisprachigkeit |
| #7 Design-System & dynamische UI-Basis | 0 von 2 zu | #16 Design-Tokens + 4 Kernkomponenten → #17 Animationsbasis (erst wenn 3–4 echte Screens existieren) |
| #38 Release & Verteilung Android | 0 von 2 zu | #39 Signierte Release-APK → #40 Automatisches GitHub-Release (**vorgezogen**) |

**#2 Initiative: Übungslexikon mit Muskel-Visualisierung**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #8 Übungsdatenbank an Bord | 0 von 6 zu | #51 Seed-/Asset-Pipeline (Enabler) → #18 Bibliothek → #19 Muskel-Mapping → #52 Eigene Übungen → #53 Favoriten → #20 Deutsche Namen (Top-50) |
| #9 Interaktive Body-Map | 0 von 3 zu | #21 Body-Map ansehen → #22 Muskel antippen → #23 Primär/Sekundär auf Detail (nach #24) |
| #10 Übungsdetail mit Ausführung | 0 von 2 zu | #24 Detailseite → #25 Credits-Screen (mit/vor #21 ausliefern) |

**#3 Initiative: Training erfassen & auswerten**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #11 Schneller Workout-Logger | 0 von 8 zu | #48 Einheiten kg/lbs → #26 Workout loggen → #49 Abschluss/Zusammenfassung → #27 Ghost-Werte → #28 Rest-Timer → #29 Satztypen → #50 Supersätze → #30 Plate Calculator |
| #55 Routinen & Vorlagen (neu) | 0 von 3 zu | #56 Routine anlegen/aus Workout → #57 Workout aus Routine starten → #58 Bearbeiten/Duplizieren |
| #12 Fortschritt sichtbar | 0 von 6 zu | #35 Export/Backup (**vorgezogen**) → #31 Historie/Kalender → #32 Charts → #33 Wochen-Heatmap → #34 PR-Erkennung → #54 Körpergewicht |

**Ruht**

- #4 Initiative: Intelligente Trainingsunterstützung – Epics entstehen, sobald Lexikon + Tracking stehen
- #5 Initiative: Kursangebote & Monetarisierung – bewusst geparkt

## Zuletzt erledigt

- #15 CI gehärtet und vollständig (Enabler; PRs #63–#66: Pinning Flutter 3.47.8 + Lockfile, Smoke-Test je PR, Debug-APK- und Screenshot-Artefakte, Nightly-Emulator-Lauf grün)
- #37 Smoke-Test-Story aufgelöst (wird Task in #15; Review 2026-10-27)

## Offene Entscheidungen (nur der Mensch)

- Finale App-ID vor dem ersten öffentlichen Release festlegen (provisorisch `de.maestrodev.maestrofit`).

## Getroffene Entscheidungen (zuletzt)

- 2026-10-27: **Planungs-Review umgesetzt** (2 unabhängige Reviews: App-Engineer + Produkt; vom Nutzer bestätigt): Reihenfolge neu (Fachwert früher, Signierung/#39 und Export/#35 vorgezogen, Design-Epic nach echten Screens, #14 nach hinten), neue Issues #47–#58 (u. a. Routinen-Epic #55, Seed-Pipeline #51, kg/lbs #48), Status `awaiting-test` + Enabler-Regel + Bug-Workflow, TDD-Regel „mindestens ein Test", Smoke = Widget-Test je PR.
- 2026-10-27: **Body-Map als eigener CustomPainter** auf den CC-BY-SVGs (kein flutter_body_atlas); Lottie vor Rive.
- 2026-10-26: Verteilung per signierter APK über GitHub Releases · Arbeitsmodus voll autonom je Story · Fehlerberichte nur lokal · App-ID provisorisch · SKILL.md (Definition of Done) angelegt.
