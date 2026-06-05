import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/core.dart';

class SectionExternalLinkBar extends StatelessWidget {
  const SectionExternalLinkBar({
    super.key,
    required this.url,
    this.label = 'Open link',
  });

  final String url;
  final String label;

  Future<void> _open(BuildContext context) async {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppMessages.invalidLink)),
      );
      return;
    }
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppMessages.linkOpenFailed)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppSpacing.sectionGap),
      padding: const EdgeInsets.all(AppSpacing.radiusLg),
      decoration: AppDecorations.whiteCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            url,
            style: AppTextStyles.manrope(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _open(context),
            icon: const Icon(Icons.open_in_new),
            label: Text(label),
          ),
        ],
      ),
    );
  }
}
