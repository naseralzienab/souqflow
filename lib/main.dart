import 'package:flutter/material.dart';
import 'package:souqflow/core/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:souqflow/providers/cart_provider.dart';
import 'package:souqflow/providers/products_provider.dart';
import 'package:souqflow/providers/reviews_provider.dart';
import 'package:souqflow/providers/theme_provider.dart';
import 'package:souqflow/screens/main_tabs_screen.dart';
import 'package:souqflow/providers/wishlist_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ReviewsProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'SouqFlow',
            theme: themeProvider.currentTheme,
            home: MainTabsScreen(),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_rounded, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'SouqFlow',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Buy, Sell & Communicate',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
