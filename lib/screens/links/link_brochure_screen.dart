import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class LinkBrochureScreen extends StatelessWidget {
  const LinkBrochureScreen({super.key});

  static const _route = '/@assets/pdf/brochure-2026.pdf';
  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Brochure',
      section: 'Links',
      route: _route,
      heroSubtitle: 'FCAIT 2026 · PDF',
      heroDescription:
          'Download the latest programme brochure with admission details, '
          'fee structure, and campus facilities overview.',
      heroIcon: Icons.picture_as_pdf_outlined,
      accentColor: _accent,
      children: [
        SectionCard(
          title: 'What\'s inside',
          icon: Icons.description_outlined,
          accentColor: _accent,
          body:
              'Programme highlights, eligibility criteria, important dates, '
              'and contact information for admissions.',
        ),
        SectionExternalLinkBar(
          url: _route,
          label: 'Open brochure',
        ),
      ],
    );
  }
}
