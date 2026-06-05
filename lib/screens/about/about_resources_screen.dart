import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class AboutResourcesScreen extends StatelessWidget {
  const AboutResourcesScreen({super.key});

  static const _accent = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Resources',
      section: 'About',
      route: '/about/resources',
      heroSubtitle: 'Downloads & references',
      heroDescription:
          'Quick access to brochures, policies, academic calendars, and '
          'helpful links for students and visitors.',
      heroIcon: Icons.folder_open_outlined,
      accentColor: const Color(0xFFB8860B),
      children: [
        Text(
          'Documents',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionListTile(
          title: 'University Prospectus 2026',
          subtitle: 'PDF · 4.2 MB · Updated Jan 2026',
          icon: Icons.picture_as_pdf_outlined,
          accentColor: Color(0xFF0B3D91),
        ),
        const SectionListTile(
          title: 'FCAIT Programme Brochure',
          subtitle: 'PDF · 2.8 MB · MCA & M.Sc. details',
          icon: Icons.menu_book_outlined,
          accentColor: Color(0xFF2C6B7A),
        ),
        const SectionListTile(
          title: 'Academic Calendar 2025–26',
          subtitle: 'PDF · 1.1 MB · Exam & holiday schedule',
          icon: Icons.calendar_month_outlined,
          accentColor: Color(0xFF5A3BA9),
        ),
        const SizedBox(height: 8),
        Text(
          'Quick links',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionListTile(
          title: 'Anti-Ragging Policy',
          subtitle: 'Guidelines & helpline numbers',
          icon: Icons.shield_outlined,
          accentColor: Color(0xFF2A5AB5),
        ),
        const SectionListTile(
          title: 'Library Portal',
          subtitle: 'E-books, journals & catalogue',
          icon: Icons.local_library_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'Student Handbook',
          subtitle: 'Rules, facilities & support services',
          icon: Icons.fact_check_outlined,
          accentColor: Color(0xFF3E5BA9),
        ),
        const SizedBox(height: 6),
        SectionCard(
          title: 'Need help?',
          icon: Icons.support_agent_outlined,
          accentColor: const Color(0xFF0B3D91),
          body:
              'Visit the Contact Us section or reach the FCAIT office on '
              'campus for admissions, document requests, and general enquiries.',
        ),
      ],
    );
  }
}
