import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Privacy Policy',
      section: 'Legal Information',
      route: '/legal/privacy-policy',
      heroSubtitle: 'User Safety & Data Policy',
      heroDescription:
          'Learn about how the GLS FCAIT application handles your data, permissions, and overall system security.',
      heroIcon: Icons.privacy_tip_outlined,
      accentColor: _accent,
      showRelatedLinks: true,
      children: [
        SectionCard(
          title: 'Data Collection',
          icon: Icons.analytics_outlined,
          accentColor: _accent,
          body:
              'The GLS FCAIT application is designed primarily for informational purposes. '
              'We do not collect, harvest, or transmit any personally identifiable information (PII) from your device.',
        ),
        SectionCard(
          title: 'App Permissions',
          icon: Icons.shield_outlined,
          accentColor: _accent,
          body:
              '• Internet Access: Required to fetch announcements and images from our servers.\n'
              '• Cache Storage: Used locally to optimize asset loads and reduce data usage.',
        ),
        SectionCard(
          title: 'Updates & Revisions',
          icon: Icons.update_outlined,
          accentColor: _accent,
          body:
              'This policy is updated periodically to comply with privacy regulations. Continued use of the app constitutes acceptance of any policy revisions.',
        ),
      ],
    );
  }
}
