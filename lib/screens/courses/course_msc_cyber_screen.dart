import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CourseMscCyberScreen extends StatelessWidget {
  const CourseMscCyberScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'M.Sc. (Cyber Security) - 2 years',
      section: 'Courses',
      route: '/courses/msc-cs',
      heroSubtitle: 'Specialised security programme',
      heroDescription:
          'Train to defend digital assets with hands-on labs in ethical hacking, '
          'forensics, secure architecture, and compliance frameworks.',
      heroIcon: Icons.security_outlined,
      accentColor: _accent,
      children: [
        Row(
          children: [
            SectionStatChip(value: '24/7', label: 'Lab access', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: 'CEH', label: 'Aligned modules', color: _accent),
          ],
        ),
        SizedBox(height: 6),
        SectionBulletList(
          title: 'Key Modules',
          accentColor: _accent,
          items: [
            'Cryptography & secure communications',
            'Penetration testing & vulnerability assessment',
            'Digital forensics & incident response',
            'Governance, risk & compliance (GRC)',
          ],
        ),
        SectionCard(
          title: 'Industry Relevance',
          icon: Icons.shield_outlined,
          accentColor: _accent,
          body:
              'Growing demand for security analysts, SOC engineers, and consultants '
              'across banking, healthcare, and government sectors.',
        ),
      ],
    );
  }
}
