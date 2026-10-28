# maestroFit – Architektur

**Stand:** 2026-10-28 · Pflege: bei jeder Architektur-/Schemaänderung aktualisieren.
Konventionen und Definition of Done: `.claude/skills/flutter-dart/SKILL.md`.

## Überblick

Flutter-App, lokal-first, keine Server. Drei Schichten je Feature
(ui → domain ← data), Zustand über Riverpod 3 (Codegen), Navigation über
go_router (StatefulShellRoute mit vier Bereichen: Übungen · Training ·
Statistik · Einstellungen), Persistenz über Drift (SQLite).

```
lib/
  core/            # Theme, Router, DB-Basis, Logging, gemeinsame Widgets
  features/
    exercises/     # Bibliothek, Detailseite, Body-Map, Credits
    workout/       # Logger, Routinen, Rest-Timer
    stats/         # Historie, Charts, Heatmap, Körpergewicht
    settings/      # Einheiten, Sprache, Log, Export
  l10n/            # ARB (de, en) – Pflicht ab Tag 1
test/              # spiegelt lib/; test/screenshots/ nur in CI (Tag)
integration_test/  # Smoke auf Emulator (nightly)
tool/              # Seed-/Asset-Pipeline (Story #51)
```

## Datenmodell (Drift-Tabellen)

Grundsätze: Gewichte intern **immer in kg** (Anzeige konvertiert nach
Einstellung, Story #48) · Zeiten als UTC-Timestamps · jede Schemaänderung =
`schemaVersion`+1 + Migration + Migrationstest · IDs: Integer autoincrement.

### Übungslexikon

**muscles** – die Muskel-Taxonomie der App (eine Wahrheit für Filter, Body-Map, Heatmap)
| Spalte | Typ | Bemerkung |
|---|---|---|
| id | int PK | |
| code | text unique | stabile ID, zugleich SVG-Pfad-ID der Body-Map (z. B. `lats`, `biceps`) |
| nameDe / nameEn | text | |
| seite | enum | vorne / hinten (für die Body-Map-Ansicht) |

**exercises**
| Spalte | Typ | Bemerkung |
|---|---|---|
| id | int PK | |
| sourceId | text null, unique | ID aus free-exercise-db; null bei eigenen Übungen (#52) |
| nameEn | text | |
| nameDe | text null | Übersetzung (Story #20, Top-50 zuerst) |
| level / mechanic / force | enum null | aus Quelle |
| equipment | text null | |
| steps | text (JSON-Liste) | Ausführungsschritte |
| bilder | text (JSON-Liste) | Asset-Pfade (Seed, Story #51) |
| istEigene | bool default false | #52 |
| favorit | bool default false | #53 |
| zuletztGenutzt | datetime null | #53 |
| license / licenseAuthor | text null | Pflichtfelder bei wger-Übernahmen |

**exercise_muscles** (n:m mit Rolle)
| exerciseId FK | muscleId FK | rolle: enum primaer/sekundaer |

Mapping free-exercise-db-Muskelname → `muscles.code` lebt als Konstanten-Tabelle
in der Seed-Pipeline (Story #19/#51) und wird getestet (jeder Quell-Muskel hat
genau ein Ziel).

### Training

**workouts**: id · startedAt · finishedAt null · notiz null · routineId FK null
**workout_exercises**: id · workoutId FK · exerciseId FK · position ·
supersetGruppe int null (gleiche Nummer = Supersatz, #50)
**sets**: id · workoutExerciseId FK · position · gewichtKg real ·
wiederholungen int · satzTyp enum (normal/warmup/dropset/failure, #29) ·
erledigtAm datetime null (null = geplant/offen)

Regel „aktives Workout überlebt Prozess-Tod“ (#26): Das laufende Workout **ist**
die Zeile mit `finishedAt == null` – es gibt keinen reinen In-Memory-Zustand;
beim App-Start wird ein offenes Workout wieder angeboten.

### Routinen (#55–#58)

**routines**: id · name · erstelltAus FK workouts null · archiviert bool
**routine_exercises**: id · routineId FK · exerciseId FK · position · supersetGruppe null
**routine_sets**: id · routineExerciseId FK · position · zielGewichtKg null · zielWdh null · satzTyp

### Statistik & Sonstiges

**body_weight_entries** (#54): id · gemessenAm · gewichtKg
Abgeleitete Werte werden **nicht** gespeichert, sondern per SQL/DAO berechnet:
geschätztes 1RM = Epley (gewicht × (1 + wdh/30)), Volumen = Σ gewicht×wdh,
Heatmap-Gewichtung: primär 1,0 / sekundär 0,5 Sätze (#33), Warm-up zählt nicht.

**Einstellungen** (kein Drift): shared_preferences hinter einem Repository –
Einheit (kg/lbs), ThemeMode, Sprache, Rest-Timer-Dauern, Hantel-/Scheibenkonfig (#30).

**Fehler-Log** (#36): Ringpuffer als Datei (JSON Lines) in den App-Dokumenten,
kein Netz; einsehbar/exportierbar in den Einstellungen.

### Export/Backup (#35)

- **JSON (vollständig):** alle Tabellen + Schemaversion → verlustfreies Restore
  (Import validiert Version und migriert).
- **CSV (Sätze):** eine Zeile je Satz (Datum, Übung, Gewicht, Wdh., Typ) für
  Auswertung außerhalb.

## Body-Map (entschieden 2026-10-27: eigener CustomPainter)

- CC-BY-SVGs (Attribution im Credits-Screen #25) → einmalig geparst
  (`flutter_svg`/`path_drawing`) zu `Path`-Objekten je `muscles.code`.
- Rendering im `CustomPainter`; Hit-Testing per `path.contains(offset)`;
  Vorder-/Rückansicht gleichzeitig bzw. Flip.
- Zustände je Muskel: neutral · primär · sekundär · Heatmap-Intensität 0..1;
  Farbwechsel immer animiert (TweenAnimationBuilder) – sichtbares
  Qualitätsmerkmal gegenüber Hevy & Co.
- Eine Widget-API für alle Verwendungen: große Map (#21/#22), Mini-Map auf der
  Detailseite (#23), Wochen-Heatmap (#33), später Recovery (Initiative #4).

## Seed-/Asset-Pipeline (#51)

`tool/seed/` (Dart-Skripte, laufen in der CI): lädt free-exercise-db,
transformiert nach Schema (inkl. Muskel-Mapping), rekomprimiert Bilder (WebP,
Zielauflösung), schreibt versionierten Seed (Assets + JSON). App importiert den
Seed beim ersten Start bzw. bei neuer Seed-Version in Drift. APK-Größenbudget
wird in #51 festgelegt und in der CI geprüft.

## Build-Umgebung

Der Agent hat kein lokales Flutter – **die CI ist die einzige Build- und
Testumgebung**. Alle Abläufe, Workflows und Umgebungs-Besonderheiten:
`.claude/skills/story-loop/SKILL.md`. Flutter-Version: `.fvmrc` (gepinnt, Stand
3.47.8); Updates nur über den Wartungs-Workflow.
