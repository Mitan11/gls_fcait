import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class TeachingStaffScreen extends StatelessWidget {
  const TeachingStaffScreen({super.key});

  static const _accent = Color(0xFF3E5BA9);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Teaching Staff',
      section: 'People',
      route: '/staff/teaching',
      heroSubtitle: 'Faculty · FCAIT-PG',
      heroDescription:
          'Experienced educators and researchers guiding MCA, M.Sc., and Ph.D. '
          'programmes with industry and academic expertise.',
      heroIcon: Icons.school_outlined,
      accentColor: _accent,
      children: [
        Text(
          'Faculty directory',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const SectionPersonCard(
          name: 'Dr. Sample Faculty',
          role: 'Professor & Head',
          subtitle: 'Software Engineering · 18+ years',
          accentColor: _accent,
        ),
        const SectionPersonCard(
          name: 'Prof. Sample Associate',
          role: 'Associate Professor',
          subtitle: 'Data Science · AI/ML research',
          accentColor: _accent,
        ),
        const SectionPersonCard(
          name: 'Dr. Sample Assistant',
          role: 'Assistant Professor',
          subtitle: 'Cyber Security · Network systems',
          accentColor: _accent,
        ),
        const SectionCard(
          title: 'Faculty Development',
          icon: Icons.trending_up_outlined,
          accentColor: _accent,
          body:
              'Regular FDPs, conference participation, and industry sabbaticals '
              'keep our teaching aligned with current technology trends.',
        ),
      ],
    );
  }
}
