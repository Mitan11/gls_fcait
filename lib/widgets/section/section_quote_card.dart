import 'package:flutter/material.dart';

import '../../core/core.dart';

class SectionQuoteCard extends StatelessWidget {
  const SectionQuoteCard({
    super.key,
    required this.quote,
    required this.author,
    required this.role,
    this.accentColor = AppColors.primary,
  });

  final String quote;
  final String author;
  final String role;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppSpacing.sectionGap),
      padding: const EdgeInsets.all(AppSpacing.pageHorizontal),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: accentColor.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.format_quote,
            color: accentColor.withValues(alpha: 0.5),
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            quote,
            style: AppTextStyles.playfair(
              fontSize: 17,
              fontStyle: FontStyle.italic,
              height: 1.5,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            author,
            style: AppTextStyles.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          Text(
            role,
            style: AppTextStyles.manrope(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
