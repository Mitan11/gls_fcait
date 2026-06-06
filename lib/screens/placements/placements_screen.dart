import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class PlacementsScreen extends StatelessWidget {
  const PlacementsScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Placements',
      section: 'Placements',
      route: '/placements',
      heroSubtitle: 'Career Development Cell',
      heroDescription:
          'Structured training, internships, and recruitment drives connecting '
          'FCAIT talent with leading employers.',
      heroIcon: Icons.work_outline,
      accentColor: _accent,
      showRelatedLinks: false,
      children: [
        Row(
          children: [
            SectionStatChip(value: '92%', label: 'Placement rate', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '8.5L', label: 'Avg. package', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '80+', label: 'Recruiters', color: _accent),
          ],
        ),
        SizedBox(height: 6),
        SectionCard(
          title: 'Training & Preparation',
          icon: Icons.psychology_outlined,
          accentColor: _accent,
          body:
              'Aptitude, communication, technical interviews, and resume workshops '
              'run throughout the programme with mock drives and mentor sessions.',
        ),
        SectionBulletList(
          title: 'Recruiting Partners (sample)',
          accentColor: _accent,
          items: [
            'TCS · Infosys · Wipro · HCL',
            'Startups in fintech & product engineering',
            'Consulting & analytics firms',
            'Campus internship programme — 6–8 weeks',
          ],
        ),
        SectionCard(
          title: 'For Recruiters',
          icon: Icons.handshake_outlined,
          accentColor: _accent,
          body:
              'Contact the placement cell to schedule pre-placement talks, '
              'written tests, and interview slots for MCA and M.Sc. batches.',
        ),
      ],
    );
  }
}
