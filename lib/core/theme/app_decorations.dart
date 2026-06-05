import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';

/// Reusable box decorations and shadows.
abstract final class AppDecorations {
  static List<BoxShadow> cardShadow({double opacity = 0.06}) => [
        BoxShadow(
          color: Colors.black.withValues(alpha: opacity),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ];

  static List<BoxShadow> tileShadow({double opacity = 0.05}) => [
        BoxShadow(
          color: Colors.black.withValues(alpha: opacity),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  static BoxDecoration whiteCard({double radius = AppSpacing.radiusLg}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: cardShadow(),
    );
  }

  static BoxDecoration whiteTile({double radius = AppSpacing.radiusMd}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: tileShadow(),
    );
  }
}
