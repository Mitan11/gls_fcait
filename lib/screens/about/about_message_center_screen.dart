import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/widgets.dart';

class AboutMessageCenterScreen extends StatelessWidget {
  const AboutMessageCenterScreen({super.key});

  static const _accent = Color(0xFF5A3BA9);

  @override
  Widget build(BuildContext context) {
    return SectionPageLayout(
      title: 'Message from the President',
      section: 'About',
      route: '/about/message-center',
      heroSubtitle: 'Leadership · GLS',
      heroDescription:
          'A note of inspiration and direction from the President of Gujarat '
          'Law Society for students, faculty, and partners.',
      heroIcon: Icons.record_voice_over_outlined,
      accentColor: _accent,
      children: [
        const SectionQuoteCard(
          quote:
              'Education is not merely the acquisition of degrees — it is the '
              'cultivation of curiosity, courage, and compassion. At GLS, we '
              'strive to build professionals who lead with integrity and innovate '
              'with purpose.',
          author: 'Dr. Sample President',
          role: 'President, Gujarat Law Society',
        ),
        const SectionCard(
          title: 'Dear Students & Colleagues',
          icon: Icons.mail_outline,
          accentColor: _accent,
          body:
              'Welcome to the GLS family. As you embark on this academic journey, '
              'remember that our institutions exist to empower you — not only with '
              'technical skills, but with the confidence to serve society. '
              'Engage deeply with your coursework, collaborate with peers, and '
              'seek mentorship from our dedicated faculty.',
        ),
        const SectionCard(
          title: 'Looking Ahead',
          icon: Icons.trending_up_outlined,
          accentColor: _accent,
          body:
              'We are investing in digital infrastructure, research centres, and '
              'industry partnerships to keep our programmes future-ready. Your '
              'success stories are our greatest measure of achievement.',
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: _accent.withOpacity(0.12),
                child: Icon(Icons.person, color: _accent, size: 30),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Office of the President',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'GLS Campus, Ahmedabad · Mon–Fri, 10 AM – 5 PM',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
