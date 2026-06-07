import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: AppColors.background,

    fontFamily: "Poppins",

    appBarTheme: const AppBarTheme(

      elevation: 0,

      backgroundColor: Colors.transparent,

      foregroundColor: Colors.black,

      centerTitle: true,

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor: AppColors.primary,

        minimumSize: const Size(double.infinity, 55),

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(30),

        ),

      ),

    ),

    inputDecorationTheme: InputDecorationTheme(

      filled: true,

      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(

        horizontal: 20,

        vertical: 18,

      ),

      border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(20),

        borderSide: BorderSide.none,

      ),

    ),

  );

}