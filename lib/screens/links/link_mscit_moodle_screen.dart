import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class LinkMscitMoodleScreen extends StatelessWidget {
  const LinkMscitMoodleScreen({super.key});

  static const _url = 'https://mscit.glsmoodle.in';
  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'M.Sc. (IT) Moodle',
      section: 'Links',
      route: _url,
      heroSubtitle: 'Learning management system',
      heroDescription:
          'M.Sc. (IT) students can access lectures, labs, and resources '
          'through the dedicated Moodle portal.',
      heroIcon: Icons.laptop_chromebook_outlined,
      accentColor: _accent,
      children: [
        SectionCard(
          title: 'Need help?',
          icon: Icons.help_outline,
          accentColor: _accent,
          body:
              'For login issues, contact the FCAIT IT lab or your programme '
              'coordinator during office hours.',
        ),
        SectionExternalLinkBar(
          url: _url,
          label: 'Open M.Sc. (IT) Moodle',
        ),
      ],
    );
  }
}
