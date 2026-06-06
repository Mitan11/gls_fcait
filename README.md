# GLS FCAIT — Official App

> **Faculty of Computer Applications & IT, GLS University, Ahmedabad**

A Flutter-based mobile application for the **Faculty of Computer Applications & Information Technology (FCAIT-PG)** at **GLS University**. The app provides students, faculty, alumni, and visitors with easy access to all information about courses, placements, campus life, publications, and more — in one beautifully designed place.

---

## 📱 Features

### 🏠 Home
- Animated hero banner with university highlights
- Auto-scrolling announcements carousel
- Quick-access campus highlight cards (Programs, Placements, Campus Life)
- Animated stats (Placement rate, Faculty count, Programmes)
- Vision & Mission section
- Campus gallery carousel

### 📖 About
- Gujarat Law Society overview
- GLS University profile
- FCAIT-PG, GLSU — faculty information
- Message from the President
- Resources (brochures, policies, handbooks)

### 🎓 Courses
- MCA — 2 years
- M.Sc. (IT) — 2 years
- M.Sc. (Cyber Security) — 2 years
- Ph.D. Programme

### 👥 People
- Teaching Staff
- Non-Teaching Staff

### 🎉 Life @ Campus
- Events & campus calendar
- Student Achievements

### 🚀 Placements
- Career Development Cell
- Training & preparation programs
- Recruiting partners

### 🎓 Alumni
- Alumni Speaks
- Alumni Portal (external link)

### 📚 Publications
- Journals
- Conference papers
- Books
- Book Chapters
- Patents

### 🔗 Quick Links
- Programme Brochure (PDF)
- MCA Moodle Portal
- M.Sc. (IT) Moodle Portal
- App Corner
- Media Corner

### 📬 Contact Us
- Office details and enquiry form

### ⚖️ Legal
- Credits
- Privacy Policy

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Framework | [Flutter](https://flutter.dev) (Dart) |
| Fonts | Google Fonts — Playfair Display, Manrope |
| Navigation | Named routes (`Navigator.pushNamed`) |
| State management | Stateful widgets + `AnimationController` |
| Platform targets | Android · iOS · Web · Windows |

---

## 📁 Project Structure

```
lib/
├── core/                  # Theme, constants, spacing
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart
│   └── constants/
├── routes/
│   ├── app_routes.dart    # All named routes
│   └── menu_data.dart     # Drawer menu sections & links
├── screens/               # One folder per feature
│   ├── splash/
│   ├── home/
│   ├── about/
│   ├── courses/
│   ├── people/
│   ├── campus/
│   ├── placements/
│   ├── alumni/
│   ├── publications/
│   ├── links/
│   ├── contact/
│   └── legal/
├── widgets/               # Reusable UI components
│   ├── layout/
│   │   ├── app_drawer.dart
│   │   └── app_bar.dart
│   └── section/
│       ├── section_page_layout.dart
│       ├── section_card.dart
│       ├── section_bullet_list.dart
│       ├── section_list_tile.dart
│       ├── section_stat_chip.dart
│       └── section_event_card.dart
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.10.0`
- Dart SDK `>=3.10.0 <4.0.0`

### Run the app

```bash
# Clone the repository
git clone <repo-url>
cd gls_fcait

# Install dependencies
flutter pub get

# Run on Chrome (web)
flutter run -d chrome

# Run on Windows desktop
flutter run -d windows

# Run on Android/iOS device
flutter run
```

### Build for production

```bash
# Web
flutter build web

# Android APK
flutter build apk --release

# Windows
flutter build windows
```

---

## 🎨 Design System

| Token | Value |
|---|---|
| Primary Blue | `#0B3D91` |
| Primary Light | `#2A5AB5` |
| Deep Blue | `#051736` |
| Gold | `#D4AF37` |
| Text Dark | `#1A2B4A` |
| Heading Font | Playfair Display |
| Body Font | Manrope |

---

## 🏫 About GLS FCAIT

**Faculty of Computer Applications & IT (FCAIT-PG)** at **GLS University**, Ahmedabad offers postgraduate programmes in:
- **MCA** (Master of Computer Applications)
- **M.Sc. (IT)** (Master of Science in Information Technology)
- **M.Sc. (Cyber Security)**
- **Ph.D.** in Computer Applications / IT

With a **92% placement rate**, 50+ faculty & staff, and industry-aligned curriculum, FCAIT-PG is one of Gujarat's premier technology education institutions.

---

*© GLS University · Faculty of Computer Applications & IT · Ahmedabad*
