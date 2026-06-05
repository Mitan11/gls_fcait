import 'package:flutter/material.dart';

import '../screens/about/about_fcait_pg_screen.dart';
import '../screens/about/about_gls_university_screen.dart';
import '../screens/about/about_gujarat_law_society_screen.dart';
import '../screens/about/about_message_center_screen.dart';
import '../screens/about/about_resources_screen.dart';
import '../screens/alumni/alumni_portal_screen.dart';
import '../screens/alumni/alumni_speaks_screen.dart';
import '../screens/campus/campus_achievements_screen.dart';
import '../screens/campus/campus_events_screen.dart';
import '../screens/contact/contact_us_screen.dart';
import '../screens/courses/course_mca_screen.dart';
import '../screens/courses/course_msc_cyber_screen.dart';
import '../screens/courses/course_msc_it_screen.dart';
import '../screens/courses/course_phd_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/links/link_app_corner_screen.dart';
import '../screens/links/link_brochure_screen.dart';
import '../screens/links/link_mca_moodle_screen.dart';
import '../screens/links/link_media_corner_screen.dart';
import '../screens/links/link_mscit_moodle_screen.dart';
import '../screens/people/non_teaching_staff_screen.dart';
import '../screens/people/teaching_staff_screen.dart';
import '../screens/placements/placements_screen.dart';
import '../screens/publications/publication_books_screen.dart';
import '../screens/publications/publication_chapters_screen.dart';
import '../screens/publications/publication_conference_screen.dart';
import '../screens/publications/publication_journal_screen.dart';
import '../screens/publications/publication_patents_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static const splash = SplashScreen.routeName;
  static const home = '/';

  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      splash: (_) => const SplashScreen(),
      home: (_) => const HomeScreen(),
      '/about/gujarat-law-society': (_) =>
          const AboutGujaratLawSocietyScreen(),
      '/about/gls-university': (_) => const AboutGlsUniversityScreen(),
      '/about/fcait-pg': (_) => const AboutFcaitPgScreen(),
      '/about/message-center': (_) => const AboutMessageCenterScreen(),
      '/about/resources': (_) => const AboutResourcesScreen(),
      '/courses/mca': (_) => const CourseMcaScreen(),
      '/courses/mscit': (_) => const CourseMscItScreen(),
      '/courses/msc-cs': (_) => const CourseMscCyberScreen(),
      '/courses/phd': (_) => const CoursePhdScreen(),
      '/staff/teaching': (_) => const TeachingStaffScreen(),
      '/staff/non-teaching': (_) => const NonTeachingStaffScreen(),
      '/campus/events': (_) => const CampusEventsScreen(),
      '/campus/student-achievements': (_) => const CampusAchievementsScreen(),
      '/placements': (_) => const PlacementsScreen(),
      '/alumni/speaks': (_) => const AlumniSpeaksScreen(),
      'https://alumni.glsuniversity.ac.in': (_) => const AlumniPortalScreen(),
      '/publications/journal': (_) => const PublicationJournalScreen(),
      '/publications/conference': (_) => const PublicationConferenceScreen(),
      '/publications/book': (_) => const PublicationBooksScreen(),
      '/publications/chapter': (_) => const PublicationChaptersScreen(),
      '/publications/patent': (_) => const PublicationPatentsScreen(),
      '/@assets/pdf/brochure-2026.pdf': (_) => const LinkBrochureScreen(),
      'https://mca.glsmoodle.in': (_) => const LinkMcaMoodleScreen(),
      'https://mscit.glsmoodle.in': (_) => const LinkMscitMoodleScreen(),
      '/app-corner': (_) => const LinkAppCornerScreen(),
      '/media-corner': (_) => const LinkMediaCornerScreen(),
      '/contact-us': (_) => const ContactUsScreen(),
    };
  }
}
