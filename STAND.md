# Stand

Aktueller Projektstand. Wird vom Agenten nach jeder Statusänderung gepflegt.
Maßgeblich sind die GitHub-Issues; diese Datei ist die Kurzfassung.

**Zuletzt aktualisiert:** 2026-10-26

## In Arbeit

- –

## Als Nächstes

- #13 App-Gerüst mit Hauptnavigation und Theme (hell/dunkel) (Epic #6) – sobald vom Nutzer freigegeben

## Backlog nach Initiative → Epic

**#1 Initiative: Technisches Fundament**

| Epic | Stand | Stories (Reihenfolge) |
|---|---|---|
| #6 Lauffähiges App-Gerüst | 0 von 3 zu | #13 App-Gerüst/Navigation/Theme → #14 Zweisprachigkeit DE/EN → #15 CI prüft jeden PR |
| #7 Design-System & dynamische UI-Basis | 0 von 2 zu | #16 Design-System als Theme → #17 Animationsbasis |

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

- Reihenfolge der ersten Stories bestätigen (Vorschlag: Epic #6 zuerst, #13 → #14 → #15); erste Story auf `ready` setzen.
- Body-Map-Technik: `flutter_body_atlas` (fertiges Package, junges 0.2.x) oder eigener CustomPainter auf denselben CC-BY-SVGs – Entscheidung spätestens bei Story #21.
- Task-Vorlage verweist auf `.claude/skills/flutter-dart/SKILL.md` (Definition of Done) – Datei existiert noch nicht; anlegen oder Verweis anpassen.
- Struktur am 2026-10-26 vom Agenten neu angelegt (Initiativen #1–#5, Epics #6–#12, Stories #13–#35) – bitte bestätigen oder umsortieren.
