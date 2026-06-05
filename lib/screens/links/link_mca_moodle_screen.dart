import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class LinkMcaMoodleScreen extends StatelessWidget {
  const LinkMcaMoodleScreen({super.key});

  static const _url = 'https://mca.glsmoodle.in';
  static const _accent = Color(0xFF2A5AB5);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'MCA Moodle',
      section: 'Links',
      route: _url,
      heroSubtitle: 'Learning management system',
      heroDescription:
          'Access MCA course materials, assignments, quizzes, and faculty '
          'announcements on the GLS Moodle platform.',
      heroIcon: Icons.laptop_mac_outlined,
      accentColor: _accent,
      children: [
        SectionBulletList(
          title: 'Student quick guide',
          accentColor: _accent,
          items: [
            'Log in with your university credentials',
            'Check weekly modules and deadlines',
            'Submit assignments before due dates',
            'Contact faculty via course forums',
          ],
        ),
        SectionExternalLinkBar(
          url: _url,
          label: 'Open MCA Moodle',
        ),
      ],
    );
  }
}
