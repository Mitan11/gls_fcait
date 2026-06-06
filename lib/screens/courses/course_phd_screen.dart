import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CoursePhdScreen extends StatelessWidget {
  const CoursePhdScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Ph.D. Programme',
      section: 'Courses',
      route: '/courses/phd',
      heroSubtitle: 'Doctoral Research · FCAIT',
      heroDescription:
          'Contribute original research in computer applications, AI, cybersecurity, '
          'and interdisciplinary IT domains under expert faculty guidance.',
      heroIcon: Icons.science_outlined,
      accentColor: _accent,
      children: [
        SectionCard(
          title: 'Research Areas',
          icon: Icons.biotech_outlined,
          accentColor: _accent,
          body:
              'Machine learning, IoT, blockchain, human-computer interaction, and '
              'applied computing for social impact — aligned with GLS research policy.',
        ),
        SectionBulletList(
          title: 'Programme Structure',
          accentColor: _accent,
          items: [
            'Coursework & research methodology (Year 1)',
            'Comprehensive exam & proposal defence',
            'Publication in peer-reviewed venues',
            'Thesis submission & viva voce',
          ],
        ),
        SectionCard(
          title: 'Eligibility',
          icon: Icons.fact_check_outlined,
          accentColor: _accent,
          body:
              'Master\'s degree in relevant discipline with minimum qualifying marks. '
              'Entrance test and interview as per university norms.',
        ),
      ],
    );
  }
}
