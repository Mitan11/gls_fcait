import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CourseMscItScreen extends StatelessWidget {
  const CourseMscItScreen({super.key});

  static const _accent = Color(0xFF2A5AB5);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'M.Sc. (IT) - 2 years',
      section: 'Courses',
      route: '/courses/mscit',
      heroSubtitle: 'Master of Science in Information Technology',
      heroDescription:
          'Deep dive into information systems, networking, and data-driven '
          'decision making for research-oriented and industry careers.',
      heroIcon: Icons.storage_outlined,
      accentColor: _accent,
      children: [
        SectionCard(
          title: 'Who Should Apply',
          icon: Icons.person_search_outlined,
          accentColor: _accent,
          body:
              'Graduates in IT, computer science, or related disciplines seeking '
              'specialisation in enterprise systems, analytics, and infrastructure.',
        ),
        SectionBulletList(
          title: 'Focus Areas',
          accentColor: _accent,
          items: [
            'Network security & administration',
            'Business intelligence & analytics',
            'Cloud computing & virtualization',
            'Research methodology & dissertation',
          ],
        ),
        Row(
          children: [
            SectionStatChip(value: '100%', label: 'Lab-oriented', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '2', label: 'Years full-time', color: _accent),
          ],
        ),
      ],
    );
  }
}
