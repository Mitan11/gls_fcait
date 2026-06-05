import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class PublicationConferenceScreen extends StatelessWidget {
  const PublicationConferenceScreen({super.key});

  static const _accent = Color(0xFF2A5AB5);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Conference',
      section: 'Publications',
      route: '/publications/conference',
      heroSubtitle: 'Presentations & proceedings',
      heroDescription:
          'Conference papers and keynote participation showcasing FCAIT '
          'research at national and international forums.',
      heroIcon: Icons.groups_outlined,
      accentColor: _accent,
      children: [
        SectionBulletList(
          title: 'Participation highlights',
          accentColor: _accent,
          items: [
            'IEEE & ACM affiliated conferences',
            'Faculty as session chairs and reviewers',
            'Student co-authorship on accepted papers',
            'Best paper awards — 3 in 2024–25',
          ],
        ),
        SectionCard(
          title: 'Upcoming',
          icon: Icons.event_note_outlined,
          accentColor: _accent,
          body:
              'National Conference on Emerging Computing (NCEC) — call for papers '
              'open; abstract deadline 30 September 2026.',
        ),
      ],
    );
  }
}
