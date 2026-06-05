import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AlumniSpeaksScreen extends StatelessWidget {
  const AlumniSpeaksScreen({super.key});

  static const _accent = Color(0xFF2A5AB5);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Alumni Speaks',
      section: 'Alumni',
      route: '/alumni/speaks',
      heroSubtitle: 'Voices from our graduates',
      heroDescription:
          'Stories and advice from FCAIT alumni building careers in technology, '
          'research, and entrepreneurship worldwide.',
      heroIcon: Icons.record_voice_over_outlined,
      accentColor: _accent,
      children: [
        SectionQuoteCard(
          quote:
              'The MCA programme gave me strong fundamentals and project experience '
              'that helped me land my first role at a product company within months '
              'of graduation.',
          author: 'Alumni Name · Batch 2020',
          role: 'Senior Software Engineer',
          accentColor: _accent,
        ),
        SectionQuoteCard(
          quote:
              'Faculty mentorship during my M.Sc. dissertation opened doors to '
              'research collaborations I never expected.',
          author: 'Alumni Name · Batch 2019',
          role: 'Data Scientist',
          accentColor: _accent,
        ),
        SectionCard(
          title: 'Alumni Engagement',
          icon: Icons.groups_outlined,
          accentColor: _accent,
          body:
              'Guest lectures, mentorship circles, and annual meetups keep our '
              'alumni network active and supportive of current students.',
        ),
      ],
    );
  }
}
