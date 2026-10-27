---
name: flutter-dart
description: Konventionen und Definition of Done für die Flutter/Dart-Entwicklung in maestroFit. Bei jedem Task (Umsetzung, Code-Review, PR) lesen und befolgen.
---

# Flutter/Dart-Konventionen maestroFit

## 1. Stack und Versionen

- Flutter stable; Version wird mit Story #15 in CI und `.fvmrc` gepinnt
  (bis dahin: `channel: stable`), Dart aus dem Flutter-SDK.
- Pakete: Drift (DB) · Riverpod 3 mit riverpod_generator (State) · go_router
  (Navigation) · freezed (Modelle) · flutter_svg (Body-Map) · fl_chart (Charts) ·
  Rive/Lottie (Animationen) · intl/ARB (Lokalisierung) · shared_preferences
  (Einstellungen).
- Neue Abhängigkeiten nur mit Begründung im PR; keine Pakete mit AGPL-Code;
  Lizenz jeder neuen Abhängigkeit prüfen und ggf. im Credits-Screen ergänzen.

## 2. Projektstruktur

Feature-first mit Schichten je Feature:

```
lib/
  core/            # Theme, Router, DB-Basis, Logging, gemeinsame Widgets/Utils
  features/
    <feature>/
      domain/      # Entitäten, Werte, Logik (reines Dart, keine Flutter-Imports)
      data/        # Drift-Tabellen/DAOs, Repositories, Seeds
      ui/          # Screens, Widgets, Provider/Controller
  l10n/            # ARB-Dateien (de, en)
test/              # spiegelt lib/-Struktur
integration_test/  # Smoke-/Flow-Tests
```

- Abhängigkeitsrichtung: ui → domain ← data. `domain` importiert weder Flutter
  noch Drift.

## 3. Code-Konventionen

- Lints: `flutter_lints` strikt plus `analysis_options.yaml` des Projekts;
  `flutter analyze` muss ohne Warnungen durchlaufen.
- Modelle/Zustände mit freezed; keine veränderlichen öffentlichen Felder.
- Keine Magic Numbers/Strings in der UI: Farben/Abstände aus dem Theme,
  Texte aus der Lokalisierung (nie hartkodiert, DE und EN immer gemeinsam pflegen).
- Öffentliche APIs kurz dokumentieren (///), Kommentare auf Deutsch.

## 4. State und Daten

- Riverpod: generierte Provider (`@riverpod`), keine globalen Singletons.
- DB-Zugriff nur über DAOs/Repositories; UI kennt kein Drift.
- Drift-Migrationen: jede Schemaänderung erhöht `schemaVersion` und bekommt
  eine Migration plus Migrationstest.
- Einstellungen über shared_preferences hinter einem Repository.

## 5. Tests (TDD)

- Reihenfolge: zuerst der rote Test, dann die Umsetzung, dann Refactoring
  (roter Zustand belegt durch Commit-Reihenfolge im PR).
- Jedes technische Akzeptanzkriterium des Tasks = mindestens ein benannter Test;
  der Testname ist das Kriterium (deutsch, beschreibend). Rein visuelle Kriterien
  per Golden-Test oder ausdrücklich „manuell beim Nutzertest“.
- Vorsicht mit `pumpAndSettle()` bei Dauer-Animationen (hängt endlos) –
  stattdessen gezielt `pump(duration)`.
- Ebenen: Unit-Tests für domain/data, Widget-Tests für ui,
  `integration_test/smoke_test.dart` als Smoke-Test (App startet, alle
  Hauptbereiche erreichbar).
- Tests deterministisch: keine echten Timer/Netzwerke; Fakes statt Mocks, wo möglich.

## 6. Branches, Commits, PRs

- Branch je Task: `task/<issue-nr>-kurztitel`; genau ein PR pro Task.
- Commits klein und benannt nach dem Warum; PR-Beschreibung nennt Task-Issue
  (`Closes #nr`) und listet die erfüllten Akzeptanzkriterien.
- Squash-Merge, Head-Branch löschen. Niemals direkt auf `main` committen
  (Ausnahme: Doku/Planung wie STAND.md, CLAUDE.md).

## 7. Definition of Done

Ein Task ist fertig, wenn:

1. Jedes technische Akzeptanzkriterium durch mindestens einen benannten, grünen
   Test belegt ist (TDD: Test zuerst geschrieben); rein visuelle Kriterien per
   Golden-Test oder markiert „manuell beim Nutzertest“.
2. `flutter analyze` ohne Fehler und Warnungen durchläuft.
3. `flutter test` (gesamte Suite) grün ist; der Smoke-Test weiterhin grün ist,
   sobald er existiert.
4. Neue UI-Texte in Deutsch **und** Englisch vorliegen (ARB gepflegt).
5. Schemaänderungen eine Migration samt Migrationstest haben.
6. Neue Abhängigkeiten begründet sind und lizenzrechtlich geprüft wurden
   (ggf. Credits-Screen ergänzt).
7. Der PR gemäß Abschnitt 6 erstellt ist, die CI grün ist und `STAND.md`
   aktualisiert wurde.
