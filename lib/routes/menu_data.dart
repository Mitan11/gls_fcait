import 'package:flutter/material.dart';

class MenuLink {
  const MenuLink({
    required this.title,
    required this.route,
    this.isExternal = false,
    this.url,
  });

  final String title;
  final String route;
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
        route: '/about/gujarat-law-society',
      ),
      MenuLink(title: 'GLS University', route: '/about/gls-university'),
      MenuLink(title: 'FCAIT-PG, GLSU', route: '/about/fcait-pg'),
      MenuLink(
        title: 'Message from the President',
        route: '/about/message-center',
      ),
      MenuLink(title: 'Resources', route: '/about/resources'),
    ],
  ),
  MenuSection(
    title: 'Courses',
    icon: Icons.school_outlined,
    links: [
      MenuLink(title: 'MCA - 2 years', route: '/courses/mca'),
      MenuLink(title: 'M.Sc. (IT) - 2 years', route: '/courses/mscit'),
      MenuLink(
        title: 'M.Sc. (Cyber Security) - 2 years',
        route: '/courses/msc-cs',
      ),
      MenuLink(title: 'Ph.D. Programme', route: '/courses/phd'),
    ],
  ),
  MenuSection(
    title: 'People',
    icon: Icons.groups_outlined,
    links: [
      MenuLink(title: 'Teaching Staff', route: '/staff/teaching'),
      MenuLink(title: 'Non-Teaching Staff', route: '/staff/non-teaching'),
    ],
  ),
  MenuSection(
    title: 'Life @ Campus',
    icon: Icons.local_activity_outlined,
    links: [
      MenuLink(title: 'Events', route: '/campus/events'),
      MenuLink(
        title: 'Student Achievements',
        route: '/campus/student-achievements',
      ),
    ],
  ),
  MenuSection(
    title: 'Placements',
    icon: Icons.work_outline,
    links: [
      MenuLink(title: 'Placements', route: '/placements'),
    ],
  ),
  MenuSection(
    title: 'Alumni',
    icon: Icons.volunteer_activism_outlined,
    links: [
      MenuLink(title: 'Alumni Speaks', route: '/alumni/speaks'),
      MenuLink(
        title: 'Alumni Portal',
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
      MenuLink(title: 'Journal', route: '/publications/journal'),
      MenuLink(title: 'Conference', route: '/publications/conference'),
      MenuLink(title: 'Books', route: '/publications/book'),
      MenuLink(title: 'Book Chapters', route: '/publications/chapter'),
      MenuLink(title: 'Patents', route: '/publications/patent'),
    ],
  ),
  MenuSection(
    title: 'Links',
    icon: Icons.link_outlined,
    links: [
      MenuLink(
        title: 'Brochure',
        route: '/@assets/pdf/brochure-2026.pdf',
        isExternal: true,
        url: '/@assets/pdf/brochure-2026.pdf',
      ),
      MenuLink(
        title: 'MCA Moodle',
        route: 'https://mca.glsmoodle.in',
        isExternal: true,
        url: 'https://mca.glsmoodle.in',
      ),
      MenuLink(
        title: 'M.Sc. (IT) Moodle',
        route: 'https://mscit.glsmoodle.in',
        isExternal: true,
        url: 'https://mscit.glsmoodle.in',
      ),
      MenuLink(title: 'App Corner', route: '/app-corner'),
      MenuLink(title: 'Media Corner', route: '/media-corner'),
    ],
  ),
  MenuSection(
    title: 'Contact Us',
    icon: Icons.mail_outline,
    links: [
      MenuLink(title: 'Contact Us', route: '/contact-us'),
    ],
  ),
  MenuSection(
    title: 'Legal Information',
    icon: Icons.gavel_outlined,
    links: [
      MenuLink(title: 'Credits', route: '/legal/credits'),
      MenuLink(title: 'Privacy Policy', route: '/legal/privacy-policy'),
    ],
  ),
];
