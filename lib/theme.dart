import "package:flutter/material.dart";

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.black,
    onError: Colors.white,
    onSurface: Colors.black,
    surface: Colors.white,
    error: Colors.red,
  ),
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    onSurface: Colors.white,
    surface: Colors.black,
    error: Colors.red,
  ),
);