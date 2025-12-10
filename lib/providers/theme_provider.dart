import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  
  ThemeData get currentTheme {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  static final ThemeData _lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xFF2196F3), 
    primaryColorDark: Color(0xFF1976D2), 
    primaryColorLight: Color(0xFF64B5F6), 
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Color(0xFF2196F3),
      foregroundColor: Colors.white, 
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white, 
      selectedItemColor: Color(0xFF2196F3),
      unselectedItemColor: Color(0xFF888888),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF333333)),
      bodyMedium: TextStyle(color: Color(0xFF666666)), 
      titleLarge: TextStyle(
        color: Color(0xFF333333),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF2196F3),
    ),
    dividerColor: Color(0xFFE0E0E0),
    cardColor: Colors.white,
  );

  static final ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF1976D2),
    primaryColorDark: Color(0xFF1565C0),
    primaryColorLight: Color(0xFF42A5F5), 
    scaffoldBackgroundColor: Color(0xFF121212),
    appBarTheme: AppBarTheme(
      color: Color(0xFF1E1E1E),
      foregroundColor: Colors.white, 
      iconTheme: IconThemeData(color: Colors.white), 
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E), 
      selectedItemColor: Color(0xFF42A5F5),
      unselectedItemColor: Color(0xFFAAAAAA),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Color(0xFFAAAAAA)),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF42A5F5),
    ),
    dividerColor: Color(0xFF333333),
    cardColor: Color(0xFF1E1E1E), 
    dialogBackgroundColor: Color(0xFF1E1E1E),
  );
}