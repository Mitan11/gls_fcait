import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AlumniPortalScreen extends StatelessWidget {
  const AlumniPortalScreen({super.key});

  static const _url = 'https://alumni.glsuniversity.ac.in';
  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Alumni Portal',
      section: 'Alumni',
      route: _url,
      heroSubtitle: 'GLS University · External',
      heroDescription:
          'Register, update your profile, connect with batchmates, and access '
          'exclusive alumni events and resources on the official portal.',
      heroIcon: Icons.public_outlined,
      accentColor: _accent,
      children: [
        SectionCard(
          title: 'Portal features',
          icon: Icons.hub_outlined,
          accentColor: _accent,
          body:
              'Directory search, event registration, donation drives, and career '
              'networking for GLS graduates across all faculties.',
        ),
        SectionExternalLinkBar(
          url: _url,
          label: 'Open Alumni Portal',
        ),
      ],
    );
  }
}
