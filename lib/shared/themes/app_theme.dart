import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light()
      .copyWith(
        // Primary Color
        primaryColor: primaryColor,
        // AppBar Theme
        appBarTheme: const AppBarTheme(
          color: primaryColor,
          elevation: 5,
        ),
        // TextButton Theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: primaryColor
          )
        ),
        // Floating Action Buttons
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          elevation: 5
        ),
        // Elevated Button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: primaryColor,
            elevation: 0
          ),
        ),
        // Dialog
        dialogTheme: DialogTheme(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        // TextFormFields
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle( color: primaryColor ),
          iconColor: primaryColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)
            )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)
            )
          ),
        )
      );

  static final ThemeData darkTheme = ThemeData.dark()
      .copyWith(
        // Primary Color
        primaryColor: primaryColor,
        // AppBar Theme
        appBarTheme: const AppBarTheme(
          color: primaryColor,
          elevation: 5,
        ),
        // Scaffold
        scaffoldBackgroundColor: Colors.black
      );
  
}