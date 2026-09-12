# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-09-12

### Added
- **Interactive Search**: Real-time filtering by animal name, diet, or habitat with animated transitions and empty-state feedback.
- **Burger Menu & Side Drawer**: Navigation drawer with live category filters (All, Carnivores, Herbivores), category counts, and about dialog.
- **Animal Quick Stats**: Metric cards for Speed, Lifespan, Diet, Weight, and Habitat in the detail view.
- **Did You Know? Facts**: Curated trivia cards in an expandable, modern bottom sheet.
- **Animated Page Indicators**: Smooth dot indicators tracking active cards with gradient accent colors.
- **Custom App Icons**: High-resolution, full-bleed orange paw launcher icons for both iOS and Android.
- **Automated Tests**: Widget smoke test suite covering app rendering, real-time search, and drawer interaction.

### Changed
- **Dart 3 & Null Safety**: Complete migration to Dart SDK `>=3.0.0 <4.0.0` with sound null safety.
- **Modernized Dependencies**: Upgraded `cupertino_icons` to `^1.0.8`, `after_layout` to `^1.2.0`, and added `flutter_lints: ^5.0.0`.
- **Toolchain Upgrades**:
  - Android Gradle migrated to modern declarative plugins syntax for Gradle 8.9+.
  - iOS deployment target upgraded to iOS 15.0+ with modern Xcode 16 compatibility and UIScene lifecycle.
- **Code Standards**: Configured strict linting rules via `analysis_options.yaml` with 0 analyzer issues.
