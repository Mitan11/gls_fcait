import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CourseMcaScreen extends StatelessWidget {
  const CourseMcaScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'MCA - 2 years',
      section: 'Courses',
      route: '/courses/mca',
      heroSubtitle: 'Master of Computer Applications',
      heroDescription:
          'A two-year professional programme focused on software engineering, '
          'data systems, and emerging technologies with strong industry alignment.',
      heroIcon: Icons.code_outlined,
      accentColor: _accent,
      children: [
        Row(
          children: [
            SectionStatChip(value: '2', label: 'Years', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '4', label: 'Semesters', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '60', label: 'Seats', color: _accent),
          ],
        ),
        SizedBox(height: 6),
        SectionCard(
          title: 'Programme Overview',
          icon: Icons.school_outlined,
          accentColor: _accent,
          body:
              'MCA at FCAIT equips graduates with advanced programming, system '
              'design, and project management skills. The curriculum blends core CS '
              'fundamentals with electives in AI, cloud, and full-stack development.',
        ),
        SectionBulletList(
          title: 'Core Subjects',
          accentColor: _accent,
          items: [
            'Advanced Data Structures & Algorithms',
            'Software Engineering & DevOps',
            'Database Management & Big Data',
            'Machine Learning & AI Applications',
            'Enterprise Application Development',
          ],
        ),
        SectionCard(
          title: 'Career Paths',
          icon: Icons.work_outline,
          accentColor: _accent,
          body:
              'Software developer, solution architect, data analyst, product engineer, '
              'and IT consultant roles with leading tech firms and startups.',
        ),
      ],
    );
  }
}
