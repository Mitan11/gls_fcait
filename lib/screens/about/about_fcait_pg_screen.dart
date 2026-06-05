import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AboutFcaitPgScreen extends StatelessWidget {
  const AboutFcaitPgScreen({super.key});

  static const _accent = Color(0xFF2C6B7A);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'FCAIT-PG, GLSU',
      section: 'About',
      route: '/about/fcait-pg',
      heroSubtitle: 'Faculty of Computer Applications & IT',
      heroDescription:
          'Postgraduate hub for MCA, M.Sc. (IT), Cyber Security, and research '
          'programmes — blending theory, labs, and industry mentorship.',
      heroIcon: Icons.computer_outlined,
      accentColor: _accent,
      children: [
        Row(
          children: [
            SectionStatChip(value: '4', label: 'PG programmes', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '12+', label: 'Specialised labs', color: _accent),
          ],
        ),
        SizedBox(height: 6),
        SectionCard(
          title: 'Who We Are',
          icon: Icons.hub_outlined,
          accentColor: _accent,
          body:
              'FCAIT-PG at GLS University delivers cutting-edge postgraduate '
              'education in computer applications and information technology. '
              'Our faculty combines academic research with real-world project '
              'experience to prepare graduates for leadership roles in tech.',
        ),
        SectionBulletList(
          title: 'Programme Highlights',
          accentColor: _accent,
          items: [
            'MCA — Software engineering, AI, and cloud computing tracks',
            'M.Sc. (IT) — Data science, networking, and enterprise systems',
            'M.Sc. Cyber Security — Threat analysis and secure architecture',
            'Ph.D. — Research in emerging computing domains',
          ],
        ),
        SectionCard(
          title: 'Learning Approach',
          icon: Icons.lightbulb_outline,
          accentColor: _accent,
          body:
              'Hands-on labs, industry guest lectures, hackathons, and placement '
              'training form the backbone of our pedagogy. Students work on live '
              'projects and publish in journals and conferences.',
        ),
      ],
    );
  }
}
