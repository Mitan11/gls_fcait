import 'package:flutter/material.dart';

import '../../core/core.dart';

class SectionPersonCard extends StatelessWidget {
  const SectionPersonCard({
    super.key,
    required this.name,
    required this.role,
    this.subtitle,
    this.accentColor = AppColors.primary,
  });

  final String name;
  final String role;
  final String? subtitle;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(AppSpacing.tilePadding),
      decoration: AppDecorations.whiteTile(),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: accentColor.withValues(alpha: 0.12),
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: AppTextStyles.manrope(
                fontWeight: FontWeight.w700,
                color: accentColor,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  role,
                  style: AppTextStyles.manrope(
                    fontSize: 12,
                    color: accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: AppTextStyles.manrope(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
