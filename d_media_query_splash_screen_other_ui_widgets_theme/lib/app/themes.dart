import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'constants/text_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,

    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      // ···
      brightness: Brightness.dark,
    ),

    appBarTheme: const AppBarTheme(
      // backgroundColor: Color.fromARGB(233, 33, 149, 243),
      // foregroundColor: Colors.white,
      elevation: 4,
      centerTitle: true,
    ),

    textTheme: const TextTheme(
      headlineSmall: AppTextStyles.headline,
      bodyLarge: AppTextStyles.body,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppTextStyles.hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static final darkTheme = ThemeData(brightness: Brightness.dark);
}
/*
--> Why Use Theme?
  - Ensures uniformity in UI design.
  - Centralizes style management.
  - Makes it easy to switch between light/dark mode.
  - You can change a whole app's appearance from a single place.

--> Common Theme Concepts in Flutter
  - ThemeData             --> The complete theme configuration object.
  - Theme widget          --> Applies a theme to part of the app (or entire app).
  - Theme.of(context)     --> Access current theme in the widget tree.
  - MaterialApp.theme     --> Defines the default global theme.
  - MaterialApp.darkTheme --> Used for dark mode UI.
  - ThemeMode.system      --> Uses the system's light/dark preference.

--> Accessing Theme in Widgets
  - You can access theme styles from the widget tree:
    e.g:
      Text(
        'Hello Themed World',
        style: Theme.of(context).textTheme.headlineSmall,
      )
    OR:
      child: Text(
        'This is a very long text that should wrap to multiple lines.',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        letterSpacing: 0.0,
      ),
  ),


--> Common ThemeData Properties
  - primaryColor              --> Main color used in the app
  - scaffoldBackgroundColor   --> Default screen background
  - appBarTheme               --> Custom AppBar styling
  - textTheme                 --> All default text styles
  - elevatedButtonTheme       --> Default style for ElevatedButton
  - iconTheme                 --> Style for all icons
  - cardTheme                 --> Card-specific styling
  - inputDecorationTheme      --> TextFields style
  - floatingActionButtonTheme --> FAB styling
  - colorScheme               --> Complete color configuration (newer approach)
*/