import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class PublicationBooksScreen extends StatelessWidget {
  const PublicationBooksScreen({super.key});

  static const _accent = Color(0xFF2C6B7A);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Books',
      section: 'Publications',
      route: '/publications/book',
      heroSubtitle: 'Authored volumes',
      heroDescription:
          'Textbooks and reference works by FCAIT faculty published with '
          'leading academic and technical presses.',
      heroIcon: Icons.auto_stories_outlined,
      accentColor: _accent,
      children: [
        SectionListTile(
          title: 'Fundamentals of Data Structures',
          subtitle: 'Dr. Sample Author · TechPress, 2024',
          icon: Icons.book_outlined,
          accentColor: _accent,
        ),
        SectionListTile(
          title: 'Cyber Security Essentials',
          subtitle: 'Prof. Sample Author · EduBooks, 2023',
          icon: Icons.book_outlined,
          accentColor: _accent,
        ),
        SectionCard(
          title: 'For authors',
          icon: Icons.edit_note_outlined,
          accentColor: _accent,
          body:
              'Faculty may submit publication details to the research cell for '
              'cataloguing and institutional recognition.',
        ),
      ],
    );
  }
}
