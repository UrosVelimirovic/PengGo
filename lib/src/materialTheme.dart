import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final fontFamily = 'Montserrat';

class AppColors {
  static const Color rhino =
      Color.fromARGB(255, 255, 255, 255); // Dark blue-gray
  static const Color aquaHaze =
      Color.fromARGB(255, 84, 211, 194); // Light blue-gray
  static const Color scooter = Color.fromARGB(255, 245, 245, 245); // Teal green
  static const Color jaffa = Color.fromARGB(255, 80, 174, 162); // Orange
}

final ThemeData materialThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness:
          Brightness.light, // Adjusted to Brightness.light for a bright palette
      background: AppColors.scooter, // Light background
      onBackground: AppColors.scooter, // Dark text on background
      surface: Color.fromARGB(255, 255, 255, 255), // Light surface elements
      onSurface: Color.fromARGB(255, 0, 0, 0), // Dark text on surface
      primary: AppColors.aquaHaze, // Teal green primary color
      onPrimary: Color.fromARGB(255, 0, 0, 0), // Dark text on primary
      secondary: AppColors.jaffa, // Orange secondary color
      onSecondary: AppColors.rhino, // Dark text on secondary
      error: AppColors.jaffa,
      onError: AppColors.jaffa,
      // No tertiary color provided in the prompt
    ),
    fontFamily: fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        fontSize: 22,
        color: AppColors.aquaHaze,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.scooter,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.rhino,
      selectedItemColor: AppColors.rhino,
      unselectedItemColor: AppColors.aquaHaze.withOpacity(0.2),
    ),
    cardTheme: CardTheme(
      color: AppColors.rhino,
      shadowColor: const Color(0x1A1B1B4E),
      surfaceTintColor: AppColors.aquaHaze,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: AppColors.aquaHaze,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: AppColors.aquaHaze,
        fontSize: 12,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: AppColors.aquaHaze),
      labelStyle: const TextStyle(color: AppColors.aquaHaze),
      alignLabelWithHint: true,
    ));
