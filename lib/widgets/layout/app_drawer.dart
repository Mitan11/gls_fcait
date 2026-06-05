import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../routes/menu_data.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.currentRoute,
  });

  final String currentRoute;

  void _navigate(BuildContext context, String route) {
    Navigator.pop(context);

    if (currentRoute == route) return;

    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.82,
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.deepBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  20,
                ),
                child: Row(
                  children: [
                    // Container(
                      // width: 58,
                      // height: 58,
                      // decoration: BoxDecoration(
                      //   color: Colors.white.withValues(alpha: 0.15),
                      //   borderRadius: BorderRadius.circular(16),
                      // ),
                      // child: const Icon(
                      //   Icons.school_rounded,
                      //   color: Colors.white,
                      //   size: 30,
                      // ),

                      /// Replace with logo if available
                      /*
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          "assets/images/gls_logo.png",
                        ),
                      ),
                      */
                    // ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.appName,
                            style: AppTextStyles.playfair(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            AppConstants.drawerSubtitle,
                            style: AppTextStyles.manrope(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// BODY
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            _drawerItem(
                              context,
                              label: "Home",
                              icon: Icons.home_rounded,
                              route: AppConstants.homeRoute,
                            ),

                            const SizedBox(height: 10),

                            for (final section in menuSections)
                              _buildSection(context, section),

                            const SizedBox(height: 16),

                          ],
                        ),
                      ),

                      /// FOOTER
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.grey.shade300,
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "GLS University",
                              style: AppTextStyles.manrope(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "Faculty of Computer Applications & IT",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.manrope(
                                fontSize: 11,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String route,
    bool external = false,
  }) {
    final selected = currentRoute == route;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primary.withValues(alpha: 0.10)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: selected
            ? Border.all(
                color: AppColors.primary.withValues(alpha: 0.15),
              )
            : null,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 2,
        ),
        leading: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withValues(alpha: 0.12)
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 22,
            color: selected
                ? AppColors.primary
                : Colors.grey.shade700,
          ),
        ),
        title: Text(
          label,
          style: AppTextStyles.manrope(
            fontWeight:
                selected ? FontWeight.w700 : FontWeight.w500,
            color:
                selected ? AppColors.primary : Colors.black87,
          ),
        ),
        trailing: external
            ? const Icon(
                Icons.open_in_new,
                size: 18,
              )
            : selected
                ? const Icon(Icons.chevron_right)
                : null,
        onTap: () => _navigate(context, route),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    MenuSection section,
  ) {
    if (section.links.length == 1) {
      final link = section.links.first;

      return _drawerItem(
        context,
        label: section.title,
        icon: section.icon,
        route: link.route,
        external: link.isExternal,
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          childrenPadding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(
                alpha: 0.10,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              section.icon,
              color: AppColors.primary,
            ),
          ),
          title: Text(
            section.title,
            style: AppTextStyles.manrope(
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            for (final link in section.links)
              _drawerItem(
                context,
                label: link.title,
                icon: Icons.folder_outlined,
                route: link.route,
                external: link.isExternal,
              ),
          ],
        ),
      ),
    );
  }
}