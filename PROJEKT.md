# maestroFit – Projektbeschreibung

**Stand:** 2026-10-28 · Pflege: bei jeder Produktentscheidung aktualisieren.

## Vision

Die bestmögliche persönliche Unterstützung beim Krafttraining: Vor dem Satz
sehe ich auf einer interaktiven Body-Map, **welche Muskeln** eine Übung
beansprucht (primär/sekundär) und **wie die Bewegung läuft**; während des
Trainings logge ich jeden Satz mit **minimalen Taps**; danach zeigt mir die App
meinen Fortschritt – bis hin zur Muskel-Heatmap der Woche.

maestroFit ist zuerst die App **eines** Nutzers (zugleich Product Owner); alles
ist auf das persönliche Trainingserlebnis optimiert, nicht auf Masse.

## Leitplanken (nicht verhandelbar)

- **Gratis-Kern für immer:** Nachschlagen, Body-Map, Tracking bleiben frei.
  Keine Werbung, keine nachträglichen Paywalls vor bestehenden Funktionen.
- **Lokal:** Alle Daten bleiben auf dem Gerät (Drift/SQLite), kein Konto, kein
  Server, kein Crash-Reporting-Dienst. Export/Backup (JSON/CSV) ist Pflicht.
- **Lizenz-sauber:** Public-Domain-Übungsdaten (free-exercise-db), CC-BY-Grafiken
  mit Credits-Screen, kein AGPL-Code, keine ungeklärten Medien.
- **Android zuerst** (APK über GitHub Releases), iOS später, Play Store optional.

## Design-Richtung (entschieden 2026-10-28)

**Dunkel-first mit kräftigem Akzent** – Gym-Ästhetik: dunkles UI als Standard,
eine energische Akzentfarbe, kräftige Typografie, flüssige Micro-Animationen.
Helles Theme bleibt vollwertig verfügbar (folgt der Systemeinstellung).
Feinschliff passiert in Epic #7, sobald 3–4 echte Screens existieren – Design
gegen reale Inhalte statt abstrakt.

## Funktionsumfang nach Initiativen

| Initiative | Kern | Status |
|---|---|---|
| #1 Technisches Fundament | Flutter-Gerüst, CI als einzige Testumgebung, Design-System, Release-Pipeline | aktiv |
| #2 Übungslexikon mit Muskel-Visualisierung | 800+ Übungen offline, interaktive Body-Map (Tap-to-Train), Übungsdetail mit Ausführung, Credits | aktiv |
| #3 Training erfassen & auswerten | Schneller Logger (Ghost-Werte, Rest-Timer, Satztypen), Routinen & Vorlagen, Statistiken + Wochen-Heatmap, Export | aktiv |
| #4 Intelligente Trainingsunterstützung | Recovery pro Muskel (Fitbod-Vorbild), Progressionshinweise, „Was trainiere ich heute?“ | ruht |
| #5 Kursangebote & Monetarisierung | Programme/Kurse, evtl. Pro/Lifetime – nur falls gewollt, Gratis-Kern unangetastet | ruht |

Markt-Inspiration (Analyse 2026-10-26): Logging-Geschwindigkeit von Hevy/Strong,
Tap-to-Train-Body-Map von MuscleWiki, Recovery-Heatmap von Fitbod,
Workout-Heatmap von GymBook – kombiniert in einer kostenlosen, lokalen App.

## Meilensteine (wann kommt was)

Jeder Meilenstein endet mit einer Test-APK als Pre-Release; der Nutzer testet
**gebündelt** je Meilenstein (Fehler → `bug`-Issues). Stories sind den
GitHub-Milestones zugeordnet.

| Meilenstein | Inhalt (Stories) | Ergebnis für den Nutzer |
|---|---|---|
| **M1 – Release-Pipeline & Datenfundament** (v0.2.0) | #39 Signierung, #40 Auto-Release, #47 Drift-Grundgerüst | Richtig signierte APK, die Updates ohne Datenverlust erlaubt |
| **M2 – Übungslexikon** (v0.3.0) | #51 Seed-Pipeline, #18 Bibliothek, #19 Muskel-Mapping, #24 Detailseite, #25 Credits | 800+ Übungen durchsuchen, Details mit Ausführung lesen |
| **M3 – Body-Map** (v0.4.0) | #21 Body-Map, #22 Tap-to-Train, #23 Muskeln auf Detailseite | Muskel antippen → Übungen; Muskelgrafik je Übung |
| **M4 – Logger-Kern** (v0.5.0) | #48 kg/lbs, #26 Loggen, #49 Abschluss, #27 Ghost-Werte, #35 Export | Komplettes Workout loggen, Daten gesichert |
| **M5 – Logger-Komfort & Routinen** (v0.6.0) | #28 Rest-Timer, #29 Satztypen, #50 Supersätze, #30 Plate Calculator, #56–#58 Routinen | Training mit minimalen Taps aus Vorlagen |
| **M6 – Statistik & Politur** (v0.7.0) | #31–#34 Statistik/Heatmap/PR, #54 Körpergewicht, #36 Fehler-Log, #14 Sprache, #16/#17 Design, #20 DE-Namen, #52/#53 eigene Übungen & Favoriten | Fortschritt sichtbar, App fühlt sich fertig an |

Danach (neue Epics, wenn dran): iOS-Release (Initiative #1) · Recovery &
Vorschläge (Initiative #4) · ggf. Monetarisierung (Initiative #5).

## Arbeitsweise

Ein KI-Agent setzt autonom um (Regeln: `CLAUDE.md`, Runbook:
`.claude/skills/story-loop/SKILL.md`, Technik: `ARCHITEKTUR.md`). Der Mensch
entscheidet Produktrichtung, testet Meilenstein-APKs und verwahrt den
Release-Keystore.
