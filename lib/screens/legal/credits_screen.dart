import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  static const _accent = Color(0xFF0B3D91);

  @override
  Widget build(BuildContext context) {
    return const SectionPageLayout(
      title: 'Credits',
      section: 'Legal Information',
      route: '/legal/credits',
      heroSubtitle: 'App Contributors',
      heroDescription:
          'Meet the team behind the GLS FCAIT application, guided by our faculty and powered by open-source technology.',
      heroIcon: Icons.info_outline,
      accentColor: _accent,
      showRelatedLinks: true,
      children: [
        SectionListTile(
          title: 'Guided by',
          subtitle: 'Dr. Harshal Arolkar\nDirector, FCAIT-PG',
          icon: Icons.person_outline_rounded,
          accentColor: _accent,
          trailing: SizedBox.shrink(),
        ),
        SectionListTile(
          title: 'Development & Design',
          subtitle: 'MSc. (IT) & MCA Students\nGLS University',
          icon: Icons.code_rounded,
          accentColor: _accent,
          trailing: SizedBox.shrink(),
        ),
        SectionCard(
          title: 'Core Technologies',
          icon: Icons.settings_input_component_rounded,
          accentColor: _accent,
          body: '• Flutter & Dart SDKs\n'
              '• Material Design 3\n'
              '• Google Fonts Integration\n'
              '• Unsplash Photography API',
        ),
      ],
    );
  }
}
