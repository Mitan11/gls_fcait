import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class PublicationJournalScreen extends StatelessWidget {
  const PublicationJournalScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Journal',
      section: 'Publications',
      route: '/publications/journal',
      heroSubtitle: 'Peer-reviewed research',
      heroDescription:
          'Faculty and student publications in indexed journals spanning '
          'computer science, IT, and interdisciplinary applications.',
      heroIcon: Icons.article_outlined,
      accentColor: _accent,
      children: [
        SectionCard(
          title: 'Research Output',
          icon: Icons.menu_book_outlined,
          accentColor: _accent,
          body:
              'Scopus, SCI, and UGC-CARE listed publications from FCAIT researchers '
              'in AI, security, and software engineering domains.',
        ),
        SectionBulletList(
          title: 'Recent entries (sample)',
          accentColor: _accent,
          items: [
            'Deep learning for medical image analysis — 2025',
            'Secure IoT protocols for smart campuses — 2025',
            'Agile adoption in SME software teams — 2024',
          ],
        ),
      ],
    );
  }
}
