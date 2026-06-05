import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class LinkMediaCornerScreen extends StatelessWidget {
  const LinkMediaCornerScreen({super.key});

  static const _accent = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Media Corner',
      section: 'Links',
      route: '/media-corner',
      heroSubtitle: 'Photos & videos',
      heroDescription:
          'Glimpses of campus life, events, guest lectures, and achievement '
          'ceremonies from FCAIT.',
      heroIcon: Icons.photo_library_outlined,
      accentColor: const Color(0xFFB8860B),
      children: [
        const SectionCard(
          title: 'Gallery categories',
          icon: Icons.collections_outlined,
          accentColor: _accent,
          body:
              'Browse albums for annual day, tech fest, sports week, and '
              'convocation — updated each semester.',
        ),
        Text(
          'Recent albums',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionListTile(
          title: 'CodeFest 2025',
          subtitle: '48 photos · Hackathon highlights',
          icon: Icons.photo_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'Guest Lecture Series',
          subtitle: '12 videos · Industry talks',
          icon: Icons.videocam_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'Sports Week 2025',
          subtitle: '32 photos · Inter-department',
          icon: Icons.sports_soccer_outlined,
          accentColor: _accent,
        ),
      ],
    );
  }
}
