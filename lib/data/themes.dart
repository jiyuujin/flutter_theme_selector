import 'package:flutter/material.dart';
import 'package:flutter_theme_selector/models/theme_color.dart';

class Themes {
  final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.blue,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey[700],
      ),
    ),
  );

  final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    primaryColor: Colors.blue,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey[200],
      ),
    ),
  );
}

ThemeColor lightMode = ThemeColor(
  gradient: [
    const Color(0xDDFF0080),
    const Color(0xDDFF8C00),
  ],
  backgroundColor: const Color(0xFFFFFFFF),
  textColor: const Color(0xFF000000),
  toggleButtonColor: const Color(0xFFFFFFFF),
  toggleBackgroundColor: const Color(0xFFe7e7e8),
  shadow: const [
    BoxShadow(
      color: Color(0xFFd8d7da),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);

ThemeColor darkMode = ThemeColor(
  gradient: [
    const Color(0xFF8983F7),
    const Color(0xFFA3DAFB),
  ],
  backgroundColor: const Color(0xFF26242e),
  textColor: const Color(0xFFFFFFFF),
  toggleButtonColor: const Color(0xFf34323d),
  toggleBackgroundColor: const Color(0xFF222029),
  shadow: const <BoxShadow>[
    BoxShadow(
      color: Color(0x66000000),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);
