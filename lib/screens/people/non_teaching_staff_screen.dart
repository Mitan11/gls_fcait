import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class NonTeachingStaffScreen extends StatelessWidget {
  const NonTeachingStaffScreen({super.key});

  static const _accent = Color(0xFF5A3BA9);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Non-Teaching Staff',
      section: 'People',
      route: '/staff/non-teaching',
      heroSubtitle: 'Administrative & support team',
      heroDescription:
          'Dedicated staff ensuring smooth operations across labs, library, '
          'examinations, and student services.',
      heroIcon: Icons.support_agent_outlined,
      accentColor: _accent,
      children: [
        const SectionCard(
          title: 'Our Role',
          icon: Icons.groups_outlined,
          accentColor: _accent,
          body:
              'From admissions coordination to IT lab maintenance, non-teaching '
              'staff form the backbone of daily campus life at FCAIT.',
        ),
        Text(
          'Key offices',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionListTile(
          title: 'Administrative Office',
          subtitle: 'Admissions, records & certificates',
          icon: Icons.business_center_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'Computer Labs',
          subtitle: 'Hardware, software & network support',
          icon: Icons.computer_outlined,
          accentColor: _accent,
        ),
        const SectionListTile(
          title: 'Library Desk',
          subtitle: 'Resources, journals & digital access',
          icon: Icons.local_library_outlined,
          accentColor: _accent,
        ),
      ],
    );
  }
}
