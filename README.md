# 🐾 Animals Kingdom

A modern, visually stunning Flutter mobile application showcasing iconic wildlife characters with interactive hero transitions, rich animal statistics, live search filtering, and an expandable facts bottom sheet.

---

## ✨ Features

- **🦁 Wildlife Characters Carousel**: Smooth `PageView` with interactive depth animations and dynamic background gradients.
- **🔍 Live Search & Filter**: Real-time search by animal name, diet, or habitat with instant results and count indicators.
- **🍔 Category Side Drawer**: Filter characters by Carnivores, Herbivores, or view all wildlife with a single tap.
- **📊 Animal Quick Stats**: Interactive metric cards showing speed, lifespan, diet, weight, and natural habitat.
- **💡 Did You Know? Facts**: Curated trivia and biological facts presented in an expandable bottom sheet.
- **📱 Sound Null Safety & Modern Flutter**: Fully migrated to Dart 3.x, sound null safety, and latest Flutter standards.
- **🎨 Custom App Icons**: Native iOS and Android launcher icons with full-bleed custom orange paw branding.

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or higher)
- Xcode (for iOS) or Android Studio (for Android)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/alaaels3id/animals.git
   cd animals
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run tests**:
   ```bash
   flutter test
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

---

## 📁 Project Structure

```
lib/
├── main.dart                  # Application entry point & ThemeData
├── styleguide.dart            # Typography & custom text styles
├── models/
│   └── character.dart         # Character model, stats, and curated dataset
├── pages/
│   ├── characters_list_screen.dart   # Main carousel screen with search & drawer
│   └── character_detail_screen.dart  # Detailed view with hero animations & stats
├── widgets/
│   └── charcter_widget.dart   # Animated animal card component
└── utilities/
    └── character_card_background_clipper.dart # Custom diagonal shape clipper
```

---

## 📄 License

This project is open source and available under the MIT License.
