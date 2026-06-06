import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class CampusEventsScreen extends StatelessWidget {
  const CampusEventsScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Events',
      section: 'Life @ Campus',
      route: '/campus/events',
      heroSubtitle: 'Campus calendar',
      heroDescription:
          'Tech fests, workshops, guest lectures, and cultural celebrations '
          'that make FCAIT a vibrant learning community.',
      heroIcon: Icons.event_outlined,
      accentColor: _accent,
      children: [
        Text(
          'Upcoming events',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionEventCard(
          date: '15 JUN',
          title: 'CodeFest 2026 — Hackathon',
          location: 'FCAIT Lab Block · 9 AM – 6 PM',
          accentColor: _accent,
        ),
        const SectionEventCard(
          date: '22 JUN',
          title: 'Industry Expert Talk: Cloud Careers',
          location: 'Seminar Hall · 11 AM',
          accentColor: _accent,
        ),
        const SectionEventCard(
          date: '05 JUL',
          title: 'Sports & Wellness Week',
          location: 'Campus Grounds',
          accentColor: _accent,
        ),
        const SectionCard(
          title: 'Get involved',
          icon: Icons.celebration_outlined,
          accentColor: _accent,
          body:
              'Student clubs and faculty coordinators welcome volunteers for '
              'event planning, publicity, and logistics.',
        ),
      ],
    );
  }
}
