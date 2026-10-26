# Stand

Aktueller Projektstand. Wird vom Agenten nach jeder Statusänderung gepflegt.
Maßgeblich sind die GitHub-Issues; diese Datei ist die Kurzfassung.

**Zuletzt aktualisiert:** 2026-10-26 (abends)

## In Arbeit

- #13 App-Gerüst mit Hauptnavigation und Theme (Epic #6) – alle Tasks gemergt (#41/PR #44, #42/PR #45, #43/PR #46); Test-APK `v0.1.0-story13` veröffentlicht, **wartet auf Nutzertest**

## Als Nächstes

- #14 Zweisprachigkeit DE/EN (Epic #6)

## Backlog nach Initiative → Epic

**#1 Initiative: Technisches Fundament**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #6 Lauffähiges App-Gerüst | 0 von 5 zu | #13 App-Gerüst/Navigation/Theme (`in-progress`, wartet auf Test) → #14 Zweisprachigkeit DE/EN → #15 CI prüft jeden PR → #37 Smoke-Test → #36 Lokales Fehler-Log |
| #7 Design-System & dynamische UI-Basis | 0 von 2 zu | #16 Design-System als Theme → #17 Animationsbasis |
| #38 Release & Verteilung Android | 0 von 2 zu | #39 Signierte Release-APK → #40 Automatisches GitHub-Release |

**#2 Initiative: Übungslexikon mit Muskel-Visualisierung**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #8 Übungsdatenbank an Bord | 0 von 3 zu | #18 Bibliothek durchsuchen/filtern → #19 Muskel-Mapping → #20 Deutsche Übungsnamen |
| #9 Interaktive Body-Map | 0 von 3 zu | #21 Body-Map ansehen → #22 Muskel antippen → Übungen → #23 Primär/Sekundär auf Übungsdetail |
| #10 Übungsdetail mit Ausführung | 0 von 2 zu | #24 Detailseite mit Ausführungsschritten → #25 Credits-/Lizenzen-Screen |

**#3 Initiative: Training erfassen & auswerten**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #11 Schneller Workout-Logger | 0 von 5 zu | #26 Workout starten/Sätze loggen → #27 Ghost-Werte → #28 Rest-Timer → #29 Satztypen/Supersätze → #30 Plate Calculator |
| #12 Fortschritt sichtbar | 0 von 5 zu | #31 Historie/Kalender → #32 Charts → #33 Wochen-Heatmap → #34 PR-Erkennung → #35 Export/Backup |

**Ruht**

- #4 Initiative: Intelligente Trainingsunterstützung – Epics entstehen, sobald Lexikon + Tracking stehen (Fitbod-Inspiration: Recovery-Heatmap, Progressionshinweise, Vorschläge)
- #5 Initiative: Kursangebote & Monetarisierung – bewusst geparkt

## Zuletzt erledigt

- –

## Offene Entscheidungen (nur der Mensch)

- Finale App-ID vor dem ersten öffentlichen Release festlegen (provisorisch `de.maestrodev.maestrofit`; Entscheidung 2026-10-26 vertagt).
- Body-Map-Technik: `flutter_body_atlas` (fertiges Package, junges 0.2.x) oder eigener CustomPainter auf denselben CC-BY-SVGs – Entscheidung spätestens bei Story #21.
- Neu angelegt am 2026-10-26 – bitte bestätigen oder umsortieren: Stories #36 (Fehler-Log) und #37 (Smoke-Test) in Epic #6; Epic #38 „Release & Verteilung Android“ mit Stories #39/#40 in Initiative #1.

## Getroffene Entscheidungen (zuletzt)

- 2026-10-26: Verteilung per signierter APK über GitHub Releases (kein Play Store vorerst) · Arbeitsmodus voll autonom je Story · Fehlerberichte nur lokal · App-ID provisorisch · `.claude/skills/flutter-dart/SKILL.md` (Definition of Done) angelegt.
