import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AboutGujaratLawSocietyScreen extends StatelessWidget {
  const AboutGujaratLawSocietyScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Gujarat Law Society',
      section: 'About',
      route: '/about/gujarat-law-society',
      heroSubtitle: 'Established 1927 · Ahmedabad',
      heroDescription:
          'A pioneering educational trust shaping generations through '
          'quality institutions across law, commerce, management, and IT.',
      heroIcon: Icons.account_balance_outlined,
      accentColor: _accent,
      children: [
        Row(
          children: [
            SectionStatChip(value: '90+', label: 'Years of legacy', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '15+', label: 'Institutions', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '50K+', label: 'Alumni network', color: _accent),
          ],
        ),
        SizedBox(height: 6),
        SectionCard(
          title: 'Our Story',
          icon: Icons.history_edu_outlined,
          accentColor: _accent,
          body:
              'Founded with a vision to make professional education accessible, '
              'Gujarat Law Society has grown into one of Gujarat\'s most trusted '
              'educational bodies. From its early law college roots to today\'s '
              'multi-disciplinary campus ecosystem, GLS continues to blend '
              'academic rigour with values-driven leadership.',
        ),
        SectionCard(
          title: 'Mission',
          icon: Icons.flag_outlined,
          accentColor: _accent,
          body:
              'To nurture competent, ethical, and socially responsible '
              'professionals who contribute meaningfully to industry and society '
              'through innovative teaching, research, and community engagement.',
        ),
        SectionBulletList(
          title: 'Core Values',
          accentColor: _accent,
          items: [
            'Excellence in teaching and student outcomes',
            'Integrity, inclusivity, and respect for diversity',
            'Industry-aligned curriculum and lifelong learning',
            'Community service and nation-building ethos',
          ],
        ),
      ],
    );
  }
}
