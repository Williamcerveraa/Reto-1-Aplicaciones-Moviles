import 'package:flutter/material.dart';

const Color _customColor = Colors.black;
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(
          selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
          'Los colores deben estar entre 0 y ${_colorThemes.length}',
        );
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
