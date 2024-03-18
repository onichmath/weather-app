import "package:flutter/material.dart";

final lightTheme = ThemeData(
  fontFamily: 'Roboto',
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 134, 184, 241),
    primary: Colors.blue,
    secondary: Color.fromARGB(255, 255, 255, 255),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Colors.white,
    onBackground: Color.fromARGB(255, 255, 255, 255),
    onError: Colors.white,
    onSurface: Colors.black,
    surface: Color.fromARGB(255, 255, 0, 0),
    error: Colors.red,
  ),
);

final darkTheme = ThemeData(
  fontFamily: 'Roboto',
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 3, 38, 56),
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