import 'package:flutter/material.dart';

class MenuLink {
  const MenuLink({
    required this.title,
    required this.route,
    this.icon = Icons.arrow_right_outlined,
    this.isExternal = false,
    this.url,
  });

  final String title;
  final String route;
  final IconData icon;
  final bool isExternal;
  final String? url;
}

class MenuSection {
  const MenuSection({
    required this.title,
    required this.icon,
    required this.links,
  });

  final String title;
  final IconData icon;
  final List<MenuLink> links;
}

const menuSections = <MenuSection>[
  MenuSection(
    title: 'About',
    icon: Icons.info_outline,
    links: [
      MenuLink(
        title: 'Gujarat Law Society',
        icon: Icons.account_balance_outlined,
        route: '/about/gujarat-law-society',
      ),
      MenuLink(
        title: 'GLS University',
        icon: Icons.school_outlined,
        route: '/about/gls-university',
      ),
      MenuLink(
        title: 'FCAIT-PG, GLSU',
        icon: Icons.computer_outlined,
        route: '/about/fcait-pg',
      ),
      MenuLink(
        title: 'Message from the President',
        icon: Icons.record_voice_over_outlined,
        route: '/about/message-center',
      ),
      MenuLink(
        title: 'Resources',
        icon: Icons.folder_open_outlined,
        route: '/about/resources',
      ),
    ],
  ),
  MenuSection(
    title: 'Courses',
    icon: Icons.school_outlined,
    links: [
      MenuLink(
        title: 'MCA - 2 years',
        icon: Icons.code_outlined,
        route: '/courses/mca',
      ),
      MenuLink(
        title: 'M.Sc. (IT) - 2 years',
        icon: Icons.devices_outlined,
        route: '/courses/mscit',
      ),
      MenuLink(
        title: 'M.Sc. (Cyber Security) - 2 years',
        icon: Icons.security_outlined,
        route: '/courses/msc-cs',
      ),
      MenuLink(
        title: 'Ph.D. Programme',
        icon: Icons.science_outlined,
        route: '/courses/phd',
      ),
    ],
  ),
  MenuSection(
    title: 'People',
    icon: Icons.groups_outlined,
    links: [
      MenuLink(
        title: 'Teaching Staff',
        icon: Icons.person_outlined,
        route: '/staff/teaching',
      ),
      MenuLink(
        title: 'Non-Teaching Staff',
        icon: Icons.support_agent_outlined,
        route: '/staff/non-teaching',
      ),
    ],
  ),
  MenuSection(
    title: 'Life @ Campus',
    icon: Icons.local_activity_outlined,
    links: [
      MenuLink(
        title: 'Events',
        icon: Icons.event_outlined,
        route: '/campus/events',
      ),
      MenuLink(
        title: 'Student Achievements',
        icon: Icons.emoji_events_outlined,
        route: '/campus/student-achievements',
      ),
    ],
  ),
  MenuSection(
    title: 'Placements',
    icon: Icons.work_outline,
    links: [
      MenuLink(
        title: 'Placements',
        icon: Icons.work_outline,
        route: '/placements',
      ),
    ],
  ),
  MenuSection(
    title: 'Alumni',
    icon: Icons.volunteer_activism_outlined,
    links: [
      MenuLink(
        title: 'Alumni Speaks',
        icon: Icons.campaign_outlined,
        route: '/alumni/speaks',
      ),
      MenuLink(
        title: 'Alumni Portal',
        icon: Icons.open_in_new,
        route: 'https://alumni.glsuniversity.ac.in',
        isExternal: true,
        url: 'https://alumni.glsuniversity.ac.in',
      ),
    ],
  ),
  MenuSection(
    title: 'Publications',
    icon: Icons.menu_book_outlined,
    links: [
      MenuLink(
        title: 'Journal',
        icon: Icons.article_outlined,
        route: '/publications/journal',
      ),
      MenuLink(
        title: 'Conference',
        icon: Icons.groups_2_outlined,
        route: '/publications/conference',
      ),
      MenuLink(
        title: 'Books',
        icon: Icons.auto_stories_outlined,
        route: '/publications/book',
      ),
      MenuLink(
        title: 'Book Chapters',
        icon: Icons.library_books_outlined,
        route: '/publications/chapter',
      ),
      MenuLink(
        title: 'Patents',
        icon: Icons.lightbulb_outline,
        route: '/publications/patent',
      ),
    ],
  ),
  MenuSection(
    title: 'Links',
    icon: Icons.link_outlined,
    links: [
      MenuLink(
        title: 'Brochure',
        icon: Icons.picture_as_pdf_outlined,
        route: '/@assets/pdf/brochure-2026.pdf',
        isExternal: true,
        url: '/@assets/pdf/brochure-2026.pdf',
      ),
      MenuLink(
        title: 'MCA Moodle',
        icon: Icons.laptop_chromebook_outlined,
        route: 'https://mca.glsmoodle.in',
        isExternal: true,
        url: 'https://mca.glsmoodle.in',
      ),
      MenuLink(
        title: 'M.Sc. (IT) Moodle',
        icon: Icons.laptop_chromebook_outlined,
        route: 'https://mscit.glsmoodle.in',
        isExternal: true,
        url: 'https://mscit.glsmoodle.in',
      ),
      MenuLink(
        title: 'App Corner',
        icon: Icons.apps_outlined,
        route: '/app-corner',
      ),
      MenuLink(
        title: 'Media Corner',
        icon: Icons.photo_library_outlined,
        route: '/media-corner',
      ),
    ],
  ),
  MenuSection(
    title: 'Contact Us',
    icon: Icons.mail_outline,
    links: [
      MenuLink(
        title: 'Contact Us',
        icon: Icons.contact_mail_outlined,
        route: '/contact-us',
      ),
    ],
  ),
  MenuSection(
    title: 'Legal Information',
    icon: Icons.gavel_outlined,
    links: [
      MenuLink(
        title: 'Credits',
        icon: Icons.stars_outlined,
        route: '/legal/credits',
      ),
      MenuLink(
        title: 'Privacy Policy',
        icon: Icons.privacy_tip_outlined,
        route: '/legal/privacy-policy',
      ),
    ],
  ),
];
