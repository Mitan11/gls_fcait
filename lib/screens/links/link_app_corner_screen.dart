import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class LinkAppCornerScreen extends StatelessWidget {
  const LinkAppCornerScreen({super.key});

  static const _accent = Color(0xFF5A3BA9);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'App Corner',
      section: 'Links',
      route: '/app-corner',
      heroSubtitle: 'Student-built apps',
      heroDescription:
          'Showcase of mobile and web applications developed by FCAIT students '
          'as part of coursework and innovation projects.',
      heroIcon: Icons.apps_outlined,
      accentColor: _accent,
      children: [
        Text(
          'Featured projects',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionListTile(
          title: 'Campus Navigator',
          subtitle: 'Flutter · Indoor maps & events',
          icon: Icons.map_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'Study Buddy',
          subtitle: 'React Native · Timetable & notes',
          icon: Icons.school_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'EcoTrack',
          subtitle: 'IoT dashboard · Sustainability',
          icon: Icons.eco_outlined,
          accentColor: _accent,
        ),
        const SectionCard(
          title: 'Submit your app',
          icon: Icons.upload_outlined,
          accentColor: _accent,
          body:
              'Final-year teams can share APK links and demos with the App Corner '
              'coordinator for listing.',
        ),
      ],
    );
  }
}
