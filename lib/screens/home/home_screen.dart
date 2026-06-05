import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../routes/menu_data.dart';
import '../../widgets/widgets.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Home Screen – modern redesign with staggered animations
// ─────────────────────────────────────────────────────────────────────────────

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _staggerController;
  late final List<Animation<double>> _fadeAnims;
  late final List<Animation<Offset>> _slideAnims;

  static const _itemCount = 7; // hero, stats, announce, vision_mission, gallery, chips, highlights

  MenuLink _findLink(String route) {
    return menuSections
        .expand((section) => section.links)
        .firstWhere((link) => link.route == route);
  }

  @override
  void initState() {
    super.initState();
    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeAnims = List.generate(_itemCount, (i) {
      final start = i * 0.12;
      final end = (start + 0.4).clamp(0.0, 1.0);
      return CurvedAnimation(
        parent: _staggerController,
        curve: Interval(start, end, curve: Curves.easeOut),
      );
    });

    _slideAnims = List.generate(_itemCount, (i) {
      final start = i * 0.12;
      final end = (start + 0.4).clamp(0.0, 1.0);
      return Tween<Offset>(
        begin: const Offset(0, 0.15),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _staggerController,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ));
    });

    _staggerController.forward();
  }

  @override
  void dispose() {
    _staggerController.dispose();
    super.dispose();
  }

  Widget _staggered(int index, Widget child) {
    return FadeTransition(
      opacity: _fadeAnims[index],
      child: SlideTransition(
        position: _slideAnims[index],
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quickLinks = [
      _findLink('/courses/mca'),
      _findLink('/courses/mscit'),
      _findLink('/campus/events'),
      _findLink('/placements'),
      _findLink('/publications/journal'),
      _findLink('/contact-us'),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(AppConstants.appName, style: AppTextStyles.appBarTitle),
      ),
      drawer: const AppDrawer(currentRoute: AppConstants.homeRoute),
      body: Stack(
        children: [
          const AppBackground(),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageHorizontal,
                12,
                AppSpacing.pageHorizontal,
                AppSpacing.pageBottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Hero Card ──
                  _staggered(0, const _HeroCard()),
                  const SizedBox(height: 20),

                  // ── Stats Row ──
                  _staggered(1, const _AnimatedStatsRow()),
                  const SizedBox(height: 22),

                  // ── Announcements Carousel ──
                  _staggered(2, const _AnnouncementsCarousel()),
                  const SizedBox(height: 24),

                  // ── Our Vision & Mission ──
                  _staggered(3, const _VisionMissionSection()),
                  const SizedBox(height: 24),

                  // ── Campus Life (Gallery) ──
                  _staggered(4, const _CampusLifeSection()),
                  const SizedBox(height: 28),

                  // ── Quick Links ──
                  _staggered(5, Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(
                        title: 'Quick Links',
                        icon: Icons.bolt_rounded,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final link in quickLinks)
                            _GlassChip(
                              label: link.title,
                              onTap: () => Navigator.pushNamed(
                                  context, link.route),
                            ),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: 28),

                  // ── Campus Highlights ──
                  _staggered(6, Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(
                        title: 'Campus Highlights',
                        icon: Icons.auto_awesome_rounded,
                      ),
                      const SizedBox(height: 12),
                      const _HighlightCards(),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section Header
// ─────────────────────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: AppColors.primary),
        ),
        const SizedBox(width: 10),
        Text(title, style: AppTextStyles.sectionHeading),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Hero Card with shimmer gradient
// ─────────────────────────────────────────────────────────────────────────────

class _HeroCard extends StatefulWidget {
  const _HeroCard();

  @override
  State<_HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<_HeroCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        final t = _shimmerController.value;
        return Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
            gradient: LinearGradient(
              colors: const [
                AppColors.primary,
                AppColors.primaryLight,
                AppColors.indigo,
                AppColors.primary,
              ],
              stops: [
                (t - 0.3).clamp(0.0, 1.0),
                t,
                (t + 0.3).clamp(0.0, 1.0),
                (t + 0.6).clamp(0.0, 1.0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.30),
                blurRadius: 24,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.school_rounded, size: 14, color: AppColors.gold),
                const SizedBox(width: 5),
                Text(
                  'NAAC Accredited',
                  style: AppTextStyles.manrope(
                    fontSize: 11,
                    color: AppColors.gold,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Faculty of Computer\nApplications & IT',
            style: AppTextStyles.playfair(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppConstants.appTagline,
            style: AppTextStyles.manrope(
              fontSize: 13,
              color: Colors.white70,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.explore_rounded, size: 18, color: Colors.white70),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Discover programs, research, placements, and student journeys — all in one place.',
                    style: AppTextStyles.manrope(
                      fontSize: 12.5,
                      color: Colors.white.withValues(alpha: 0.85),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated Stats Row with counting animation
// ─────────────────────────────────────────────────────────────────────────────

class _AnimatedStatsRow extends StatefulWidget {
  const _AnimatedStatsRow();

  @override
  State<_AnimatedStatsRow> createState() => _AnimatedStatsRowState();
}

class _AnimatedStatsRowState extends State<_AnimatedStatsRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _countController;

  static const _stats = [
    _StatData('4', 'PG Programmes', Icons.school_rounded, 4),
    _StatData('92%', 'Placements', Icons.trending_up_rounded, 92),
    _StatData('50+', 'Faculty & Staff', Icons.groups_rounded, 50),
  ];

  @override
  void initState() {
    super.initState();
    _countController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..forward();
  }

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < _stats.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Expanded(
            child: _AnimatedStatTile(
              stat: _stats[i],
              animation: CurvedAnimation(
                parent: _countController,
                curve: Interval(
                  i * 0.15,
                  (i * 0.15 + 0.7).clamp(0.0, 1.0),
                  curve: Curves.easeOutCubic,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _StatData {
  const _StatData(this.display, this.label, this.icon, this.numericValue);

  final String display;
  final String label;
  final IconData icon;
  final int numericValue;
}

class _AnimatedStatTile extends StatelessWidget {
  const _AnimatedStatTile({required this.stat, required this.animation});

  final _StatData stat;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final value = (stat.numericValue * animation.value).round();
        final suffix = stat.display.contains('%')
            ? '%'
            : stat.display.contains('+')
                ? '+'
                : '';
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.06),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(stat.icon, size: 20, color: AppColors.primary.withValues(alpha: 0.6)),
              const SizedBox(height: 8),
              Text(
                '$value$suffix',
                style: AppTextStyles.playfair(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stat.label,
                textAlign: TextAlign.center,
                style: AppTextStyles.manrope(
                  fontSize: 10,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Announcements Carousel (auto-scrolling)
// ─────────────────────────────────────────────────────────────────────────────

class _AnnouncementsCarousel extends StatefulWidget {
  const _AnnouncementsCarousel();

  @override
  State<_AnnouncementsCarousel> createState() => _AnnouncementsCarouselState();
}

class _AnnouncementsCarouselState extends State<_AnnouncementsCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  static const _announcements = [
    _Announcement(
      'Admissions Open 2026',
      'MCA, M.Sc.(IT) & M.Sc.(Cyber Security) — Apply now for the new academic session.',
      Icons.campaign_rounded,
      AppColors.primary,
    ),
    _Announcement(
      'Placement Drive 2026',
      'Top recruiters visiting campus this semester. Get career-ready with our training programs.',
      Icons.work_rounded,
      AppColors.purple,
    ),
    _Announcement(
      'Research & Innovation',
      'Faculty publications featured in international journals. Explore our research excellence.',
      Icons.science_rounded,
      AppColors.teal,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final next = (_currentPage + 1) % _announcements.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 110,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: _announcements.length,
            itemBuilder: (_, i) {
              final a = _announcements[i];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  gradient: LinearGradient(
                    colors: [
                      a.color.withValues(alpha: 0.08),
                      a.color.withValues(alpha: 0.03),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: a.color.withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: a.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(a.icon, color: a.color, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            a.title,
                            style: AppTextStyles.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: a.color,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            a.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.manrope(
                              fontSize: 12,
                              color: Colors.black54,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_announcements.length, (i) {
            final active = i == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.20),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _Announcement {
  const _Announcement(this.title, this.description, this.icon, this.color);

  final String title;
  final String description;
  final IconData icon;
  final Color color;
}


// ─────────────────────────────────────────────────────────────────────────────
// Frosted Glass Chip
// ─────────────────────────────────────────────────────────────────────────────

class _GlassChip extends StatelessWidget {
  const _GlassChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.10),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_forward_rounded,
                size: 14,
                color: AppColors.primary.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyles.manrope(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Campus Highlight Cards
// ─────────────────────────────────────────────────────────────────────────────

class _HighlightCards extends StatelessWidget {
  const _HighlightCards();

  @override
  Widget build(BuildContext context) {
    final items = [
      _HighlightItem(
        title: 'Programs',
        subtitle: 'MCA, M.Sc. (IT), Cyber Security & Ph.D.',
        icon: Icons.school_rounded,
        color: AppColors.indigo,
        route: '/courses/mca',
        accent: const Color(0xFF6C8DD5),
      ),
      _HighlightItem(
        title: 'Placements',
        subtitle: 'Career-ready training & campus hiring drives',
        icon: Icons.rocket_launch_rounded,
        color: AppColors.purple,
        route: '/placements',
        accent: const Color(0xFF8B6FE0),
      ),
      _HighlightItem(
        title: 'Campus Life',
        subtitle: 'Events, clubs, workshops & achievements',
        icon: Icons.celebration_rounded,
        color: AppColors.teal,
        route: '/campus/events',
        accent: const Color(0xFF4BA3A3),
      ),
    ];

    return Column(
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _HighlightCard(item: item),
          ),
      ],
    );
  }
}

class _HighlightItem {
  const _HighlightItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
    required this.accent,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route;
  final Color accent;
}

class _HighlightCard extends StatefulWidget {
  const _HighlightCard({required this.item});

  final _HighlightItem item;

  @override
  State<_HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<_HighlightCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _hoverController;
  late final Animation<double> _elevation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _elevation = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return GestureDetector(
      onTapDown: (_) => _hoverController.forward(),
      onTapUp: (_) {
        _hoverController.reverse();
        Navigator.pushNamed(context, item.route);
      },
      onTapCancel: () => _hoverController.reverse(),
      child: AnimatedBuilder(
        animation: _elevation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: item.color.withValues(alpha: 0.08 + _elevation.value * 0.01),
                  blurRadius: 12 + _elevation.value,
                  offset: Offset(0, 4 + _elevation.value * 0.5),
                ),
              ],
              border: Border.all(
                color: item.color.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      item.color.withValues(alpha: 0.14),
                      item.accent.withValues(alpha: 0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(item.icon, color: item.color, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppTextStyles.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.subtitle,
                      style: AppTextStyles.manrope(
                        fontSize: 12,
                        color: Colors.black54,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: item.color.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: item.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Our Vision & Mission Section
// ─────────────────────────────────────────────────────────────────────────────

class _VisionMissionSection extends StatelessWidget {
  const _VisionMissionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Our Vision & Mission',
                style: AppTextStyles.playfair(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.goldDark,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const _VisionMissionCard(
          title: 'Vision',
          content:
              'To be a globally recognized center of excellence in computer applications and information technology education, fostering innovation, research, and leadership in the digital age.',
          icon: Icons.visibility_rounded,
          watermarkIcon: Icons.visibility_outlined,
          iconColor: AppColors.primary,
        ),
        const SizedBox(height: 16),
        const _VisionMissionCard(
          title: 'Mission',
          content:
              'To provide high-quality education through industry-aligned curriculum, state-of-the-art infrastructure, and a holistic learning environment that empowers students to excel in the global IT sector.',
          icon: Icons.rocket_launch_rounded,
          watermarkIcon: Icons.rocket_launch_outlined,
          iconColor: AppColors.goldDark,
        ),
      ],
    );
  }
}

class _VisionMissionCard extends StatelessWidget {
  const _VisionMissionCard({
    required this.title,
    required this.content,
    required this.icon,
    required this.watermarkIcon,
    required this.iconColor,
  });

  final String title;
  final String content;
  final IconData icon;
  final IconData watermarkIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -20,
            child: Icon(
              watermarkIcon,
              size: 140,
              color: iconColor.withValues(alpha: 0.035),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: AppTextStyles.manrope(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  content,
                  style: AppTextStyles.manrope(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Campus Life (Gallery) Section
// ─────────────────────────────────────────────────────────────────────────────

class _CampusLifeSection extends StatelessWidget {
  const _CampusLifeSection();

  static const _images = [
    'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=800&q=80', // coding event
    'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=400&q=80', // students working
    'https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=400&q=80', // students talking on steps
    'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?auto=format&fit=crop&w=400&q=80', // library
    'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=400&q=80', // stage event
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gallery',
                    style: AppTextStyles.playfair(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Recent events and memories from GLS FCAIT',
                    style: AppTextStyles.manrope(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const _GalleryCarousel(images: _images),
      ],
    );
  }
}

class _GalleryCarousel extends StatefulWidget {
  const _GalleryCarousel({required this.images});

  final List<String> images;

  @override
  State<_GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<_GalleryCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final next = (_currentPage + 1) % widget.images.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: widget.images.length,
            itemBuilder: (_, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                  child: Image.network(
                    widget.images[i],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: AppColors.primary.withValues(alpha: 0.03),
                        child: const Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(AppColors.primary),
                            ),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.primary.withValues(alpha: 0.05),
                      child: Icon(
                        Icons.image_outlined,
                        color: AppColors.primary.withValues(alpha: 0.4),
                        size: 28,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (i) {
            final active = i == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active
                    ? AppColors.primary
                    : AppColors.primary.withValues(alpha: 0.20),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
