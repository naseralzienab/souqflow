# SouqFlow

A Flutter E-Commerce application.

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-blue?style=for-the-badge" alt="Multi-Platform">
  <img src="https://img.shields.io/badge/State%20Management-Provider-FF5722?style=for-the-badge" alt="Provider">
</p>

<p align="center">
  A complete e-commerce mobile application built with Flutter, featuring modern UI, smooth UX, and multi-platform support.
</p>

<p align="center">
  <img src="C:\flutter_projects\souqflow\lib\assets\images\app_icon.png" width="200" alt="App Icon">
</p>

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td><img src="C:\flutter_projects\souqflow\lib\assets\screenshots\SF1.jpg" width="200" alt="Home Screen Light"></td>
      <td><img src="C:\flutter_projects\souqflow\lib\assets\screenshots\SF2.jpg" width="200" alt="Cart Screen Light"></td>
      <td><img src="C:\flutter_projects\souqflow\lib\assets\screenshots\SF3.jpg" width="200" alt="Profile Screen Light"></td>
      <td><img src="C:\flutter_projects\souqflow\lib\assets\screenshots\SF4.jpg" width="200" alt="Home Screen Dark"></td>
      <td><img src="C:\flutter_projects\souqflow\lib\assets\screenshots\SF5.jpg" width="200" alt="Cart Screen Dark"></td>
      <td><img src="C:\flutter_projects\souqflow\lib\assets\screenshots\SF6.jpg" width="200" alt="Profile Screen Dark"></td>
    </tr>
    <tr>
      <td align="center">Home Screen Light</td>
      <td align="center">Cart Screen Light</td>
      <td align="center">Profile Screen Light</td>
      <td align="center">Home Screen Dark</td>
      <td align="center">Cart Screen Dark</td>
      <td align="center">Profile Screen Dark</td>

    </tr>
  </table>
</div>

## Features

- **Modern UI/UX**: Built with Material Design 3 & responsive layout
- **Smart Search**: Fast product search with filters
- **Multi-Platform**: Runs on Android, iOS, Web, Windows, Linux & macOS
- **State Management**: Efficient state handling using Provider
- **Theme Support**: Light/Dark mode ready (if implemented)
- **High Performance**: Optimized for smooth user experience

## Project Architecture

### **Folder Structure**

lib/
├── main.dart                    # Application entry point
├── assets/                      # Images, fonts, icons
├── core/                        # Core functionality
│   └── constants/               # App constants (colors, text, routes)
├── models/                      # Data models (Product, User, CartItem)
├── providers/                   # State management using Provider
├── screens/                     # Application screens
│   ├── home_screen.dart
│   ├── products_screen.dart
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart     # Order completion screen
│   └── profile_screen.dart
└── widgets/                     # Reusable UI components
    ├── product_card.dart
    ├── cart_item_widget.dart
    ├── custom_appbar.dart
    └── loading_indicator.dart

## Technologies Used
Technology         |    Purpose
Flutter 3.x        |    Cross-platform UI framework
Dart 3.x	       |    Programming language
Provider	       |    State management solution
Material Design 3  |    UI components & theming
HTTP	           |    API communication (if used)
Shared Preferences |    Local data persistence

## Getting Started
Prerequisites
- Flutter SDK (version 3.0 or higher)
- Android Studio / VS Code
- Android emulator or physical device

## Platform Support

**Android**
- Material Design implementation
- Adaptive icons and splash screen

**iOS**
- Cupertino-style components
- iOS-specific UI patterns

## Challenges & Solutions

Challenge                |     Solution
Cart State Management    |     Used Provider to share cart state across screens
Form Validation	         |     Implemented Form with TextFormField validators
Responsive Design	     |     Used MediaQuery, LayoutBuilder, and adaptive widgets
Performance Optimization |	Implemented ListView.builder and image caching

## License
This project is licensed under the MIT License - see the LICENSE file for details.

👨‍💻 Developer
Naser Alzienab - GitHub - LinkedIn
