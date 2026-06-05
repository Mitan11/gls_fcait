import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class PublicationPatentsScreen extends StatelessWidget {
  const PublicationPatentsScreen({super.key});

  static const _accent = Color(0xFFB8860B);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Patents',
      section: 'Publications',
      route: '/publications/patent',
      heroSubtitle: 'Intellectual property',
      heroDescription:
          'Patents filed and granted for innovations developed at FCAIT in '
          'software systems, IoT, and assistive technologies.',
      heroIcon: Icons.verified_outlined,
      accentColor: _accent,
      children: [
        Row(
          children: [
            SectionStatChip(value: '8+', label: 'Filed', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '5', label: 'Granted', color: _accent),
          ],
        ),
        SizedBox(height: 6),
        SectionListTile(
          title: 'Smart Attendance System',
          subtitle: 'Indian Patent · Granted 2024',
          icon: Icons.lightbulb_outline,
          accentColor: _accent,
        ),
        SectionListTile(
          title: 'Anomaly Detection in Networks',
          subtitle: 'Application pending · 2025',
          icon: Icons.lightbulb_outline,
          accentColor: _accent,
        ),
        SectionCard(
          title: 'IP support',
          icon: Icons.gavel_outlined,
          accentColor: Color(0xFF0B3D91),
          body:
              'The university IP cell assists with prior art search, filing, and '
              'technology transfer for faculty-led inventions.',
        ),
      ],
    );
  }
}
