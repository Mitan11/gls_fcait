import 'package:flutter/material.dart';

import '../../core/core.dart';

class SectionStatChip extends StatelessWidget {
  const SectionStatChip({
    super.key,
    required this.value,
    required this.label,
    this.color = AppColors.primary,
  });

  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          boxShadow: AppDecorations.tileShadow(),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: AppTextStyles.playfair(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppTextStyles.manrope(
                fontSize: 11,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
