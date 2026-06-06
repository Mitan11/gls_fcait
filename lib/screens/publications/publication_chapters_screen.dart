import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class PublicationChaptersScreen extends StatelessWidget {
  const PublicationChaptersScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Book Chapters',
      section: 'Publications',
      route: '/publications/chapter',
      heroSubtitle: 'Contributed chapters',
      heroDescription:
          'Invited and contributed chapters in edited volumes on computing, '
          'education technology, and industry trends.',
      heroIcon: Icons.library_books_outlined,
      accentColor: _accent,
      children: [
        SectionBulletList(
          title: 'Sample chapters',
          accentColor: _accent,
          items: [
            'Cloud-native architectures — Ed. Smith et al., 2025',
            'Ethics in AI education — Handbook of CS Pedagogy, 2024',
            'Blockchain in supply chain — Wiley Compendium, 2024',
          ],
        ),
        SectionCard(
          title: 'Collaborations',
          icon: Icons.handshake_outlined,
          accentColor: _accent,
          body:
              'Cross-faculty and international co-authorship supported through '
              'GLS research grants and MOUs.',
        ),
      ],
    );
  }
}
