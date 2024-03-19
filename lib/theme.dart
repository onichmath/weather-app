import "package:flutter/material.dart";

final lightTheme = ThemeData(
  fontFamily: 'Roboto',
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 134, 184, 241),
    primary: Colors.black,
    secondary: Colors.blue,
    onPrimary: Color.fromARGB(255, 22, 87, 161),
    onSecondary: Colors.white,
    onBackground: Colors.black,
    onError: Colors.black,
    onSurface: Colors.white,
    surface: Colors.blueGrey,
    error: Colors.red,
  ),
);

final darkTheme = ThemeData(
  fontFamily: 'Roboto',
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 0, 0, 0),
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    onPrimary: Color.fromARGB(255, 6, 26, 49),
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    onSurface: Colors.white,
    surface: Color.fromARGB(255, 3, 38, 56),
    error: Colors.red,
  ),
);