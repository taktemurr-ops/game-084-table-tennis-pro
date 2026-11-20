import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'rally_engine.dart';
import 'rally_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-084-table-tennis-pro',
  title: const ['Masa Tenisi Pro', 'Table Tennis Pro', 'Tischtennis Pro', 'Tenis de Mesa Pro', 'Tennis de Table Pro'],
  tagline: const ['Hızlı ralliler, keskin açılar!', 'Fast rallies, sharp angles!', 'Schnelle Ballwechsel!', '¡Peloteos rápidos!', 'Échanges rapides !'],
  seedColor: const Color(0xFF1D4ED8),
  icon: Icons.sports_tennis,
  rules: TableTennisRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => RallySim((ctx.generated as GeneratedLevel<RallyLevel>).puzzle),
    paint: paintRally,
    sound: rallySound,
    boosterIcon: Icons.flash_on,
    boosterLabel: (l) => l == 'tr' ? 'Süper vuruş' : 'Super shot',
    howTo: const ['Parmağını sürükle: raket parmağının biraz üstünde durur. Top raketin menziline girince otomatik vurulur; topa raketin sağıyla vurursan sağa, soluyla vurursan sola gider. Yukarı kaydır: sert vuruş.', 'Drag your finger: the racket follows just above it. Hits are automatic in reach; meet the ball with the right side to aim right, left side to aim left. Swipe up for a power shot.', 'Finger ziehen: der Schläger folgt. Schläge automatisch, nach oben wischen: harter Schlag.', 'Arrastra el dedo: la raqueta te sigue. Golpe automático; desliza arriba: golpe fuerte.', 'Glissez : la raquette suit. Frappe automatique ; glissez vers le haut : coup puissant.'],
  ),
  tutorial: const [
    TutorialStep(Icons.open_with, ['Raketi topun geleceği yere götür.', 'Move the racket to where the ball will be.', 'Schläger zum Ball.', 'Mueve la raqueta.', 'Placez la raquette.']),
    TutorialStep(Icons.call_split, ['Topa raketin kenarıyla vurursan açılı gider.', 'Use the racket edge for angled shots.', 'Kante = Winkel.', 'Borde = ángulo.', 'Bord = angle.']),
    TutorialStep(Icons.north, ['Yukarı kaydır: sert vuruş.', 'Swipe up for a power shot.', 'Nach oben: harter Schlag.', 'Arriba: golpe fuerte.', 'Vers le haut : coup fort.']),
  ],
);
