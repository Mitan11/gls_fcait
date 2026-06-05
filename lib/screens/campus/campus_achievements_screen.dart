import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class CampusAchievementsScreen extends StatelessWidget {
  const CampusAchievementsScreen({super.key});

  static const _accent = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Student Achievements',
      section: 'Life @ Campus',
      route: '/campus/student-achievements',
      heroSubtitle: 'Pride & milestones',
      heroDescription:
          'Celebrating competitions, publications, placements, and leadership '
          'by FCAIT students across the nation.',
      heroIcon: Icons.emoji_events_outlined,
      accentColor: const Color(0xFFB8860B),
      children: [
        const Row(
          children: [
            SectionStatChip(value: '50+', label: 'Awards 2025', color: _accent),
            SizedBox(width: 10),
            SectionStatChip(value: '12', label: 'National wins', color: _accent),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Recent highlights',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionListTile(
          title: 'Smart India Hackathon — Winner',
          subtitle: 'Team Innovate · MCA 2025 batch',
          icon: Icons.emoji_events,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'Best Paper Award — IEEE Conference',
          subtitle: 'M.Sc. (IT) research scholar',
          icon: Icons.article_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'National Coding Championship — Top 10',
          subtitle: 'Cyber Security specialization',
          icon: Icons.code,
          accentColor: _accent,
        ),
        const SectionCard(
          title: 'Share your story',
          icon: Icons.campaign_outlined,
          accentColor: Color(0xFF0B3D91),
          body:
              'Students and faculty can nominate achievements for the campus '
              'newsletter and social media features.',
        ),
      ],
    );
  }
}
