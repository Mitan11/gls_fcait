import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AboutGlsUniversityScreen extends StatelessWidget {
  const AboutGlsUniversityScreen({super.key});

  static const _accent = Color(0xFF2A5AB5);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'GLS University',
      section: 'About',
      route: '/about/gls-university',
      heroSubtitle: 'State Private University · Gujarat',
      heroDescription:
          'A vibrant university offering UG, PG, and doctoral programmes across '
          'faculties of law, business, IT, design, and liberal studies.',
      heroIcon: Icons.school_outlined,
      accentColor: _accent,
      children: [
        SectionCard(
          title: 'Vision',
          icon: Icons.visibility_outlined,
          accentColor: _accent,
          body:
              'To be a globally recognised university that empowers learners '
              'with knowledge, skills, and character to thrive in a dynamic world.',
        ),
        SectionCard(
          title: 'Campus Life',
          icon: Icons.location_city_outlined,
          accentColor: _accent,
          body:
              'Spread across a modern urban campus in Ahmedabad, GLS University '
              'offers smart classrooms, digital libraries, innovation labs, sports '
              'facilities, and active student clubs that enrich the learning journey.',
        ),
        SectionBulletList(
          title: 'Academic Faculties',
          accentColor: _accent,
          items: [
            'Faculty of Law',
            'Faculty of Management & Commerce',
            'Faculty of Computer Applications & IT',
            'Faculty of Design & Liberal Studies',
            'Doctoral Research Centre',
          ],
        ),
        Row(
          children: [
            SectionStatChip(
              value: '100+',
              label: 'Programmes',
              color: _accent,
            ),
            SizedBox(width: 10),
            SectionStatChip(
              value: '200+',
              label: 'Faculty members',
              color: _accent,
            ),
          ],
        ),
      ],
    );
  }
}
