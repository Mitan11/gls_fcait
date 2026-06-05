import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../routes/menu_data.dart';
import '../layout/app_background.dart';
import '../layout/app_drawer.dart';
import 'section_hero_banner.dart';

export 'section_bullet_list.dart';
export 'section_card.dart';
export 'section_event_card.dart';
export 'section_external_link.dart';
export 'section_list_tile.dart';
export 'section_person_card.dart';
export 'section_quote_card.dart';
export 'section_stat_chip.dart';

class SectionPageLayout extends StatelessWidget {
  const SectionPageLayout({
    super.key,
    required this.title,
    required this.section,
    required this.route,
    required this.heroSubtitle,
    required this.heroDescription,
    required this.heroIcon,
    required this.accentColor,
    required this.children,
    this.showRelatedLinks = true,
  });

  final String title;
  final String section;
  final String route;
  final String heroSubtitle;
  final String heroDescription;
  final IconData heroIcon;
  final Color accentColor;
  final List<Widget> children;
  final bool showRelatedLinks;

  List<MenuLink> get _relatedLinks {
    final match = menuSections.where((s) => s.title == section);
    if (match.isEmpty) return [];
    return match.first.links.where((l) => l.route != route).toList();
  }

  @override
  Widget build(BuildContext context) {
    final related = showRelatedLinks ? _relatedLinks : <MenuLink>[];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(title, style: AppTextStyles.appBarTitle),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(currentRoute: route),
      body: Stack(
        children: [
          const AppBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageHorizontal,
                AppSpacing.pageTop,
                AppSpacing.pageHorizontal,
                AppSpacing.pageBottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(section.toUpperCase(), style: AppTextStyles.sectionLabel),
                  const SizedBox(height: 12),
                  SectionHeroBanner(
                    title: title,
                    subtitle: heroSubtitle,
                    description: heroDescription,
                    icon: heroIcon,
                    accentColor: accentColor,
                  ),
                  const SizedBox(height: 20),
                  ...children,
                  if (related.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text('Explore more', style: AppTextStyles.sectionHeading),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: AppSpacing.chipGap,
                      runSpacing: AppSpacing.chipGap,
                      children: [
                        for (final item in related)
                          ActionChip(
                            label: Text(item.title),
                            backgroundColor: Colors.white,
                            elevation: 2,
                            onPressed: () {
                              Navigator.pushNamed(context, item.route);
                            },
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
