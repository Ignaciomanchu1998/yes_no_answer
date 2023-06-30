import 'package:flutter/material.dart';

class ThemeApp {
  static Color customColor = const Color(0xFF00BFA6);

  static List<Color> themeColor = [
    customColor,
    Colors.blue,
    Colors.teal,
    Colors.purple,
    Colors.pink,
    Colors.orange,
  ];

  final int selectedColor;

  ThemeApp({required this.selectedColor})
      : assert(
          selectedColor >= 0 && selectedColor <= themeColor.length - 1,
          'Colores disponibles: 0 - ${themeColor.length - 1}',
        );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: themeColor[selectedColor],
      brightness: Brightness.light,
      platform: TargetPlatform.iOS,
    );
  }
}
