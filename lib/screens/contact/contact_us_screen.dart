import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Contact Us',
      section: 'Contact Us',
      route: '/contact-us',
      heroSubtitle: 'FCAIT-PG · GLS University',
      heroDescription:
          'Reach us for admissions, programme enquiries, placements, and '
          'general information about the faculty.',
      heroIcon: Icons.mail_outline,
      accentColor: _accent,
      showRelatedLinks: false,
      children: [
        const SectionListTile(
          title: 'Campus address',
          subtitle:
              'GLS University, Netaji Road, Law Garden, Ellisbridge, Ahmedabad',
          icon: Icons.location_on_outlined,
          accentColor: _accent,
          trailing: SizedBox.shrink(),
        ),
        const SectionListTile(
          title: 'Phone',
          subtitle: '+91 79 0000 0000 (sample)',
          icon: Icons.phone_outlined,
          accentColor: _accent,
          trailing: SizedBox.shrink(),
        ),
        const SectionListTile(
          title: 'Email',
          subtitle: 'fcait@glsuniversity.ac.in (sample)',
          icon: Icons.email_outlined,
          accentColor: _accent,
          trailing: SizedBox.shrink(),
        ),
        const SectionCard(
          title: 'Office hours',
          icon: Icons.schedule_outlined,
          accentColor: _accent,
          body:
              'Monday to Friday · 10:00 AM – 5:00 PM\n'
              'Saturday · 10:00 AM – 1:00 PM (admissions only)',
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0B3D91), Color(0xFF2A5AB5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send a message',
                style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Form integration coming soon. For urgent queries, call or '
                'email the office directly.',
                style: GoogleFonts.manrope(
                  color: Colors.white70,
                  fontSize: 13,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
