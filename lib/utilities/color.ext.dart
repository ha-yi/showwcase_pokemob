import 'package:flutter/material.dart';

extension ColorExt on Color {
  /// get alternating/different color from the current color and return new color
  Color getDifferentColor() {
    var tred = (red + 50) % 256;
    var tgreen = (green + 100) % 256;
    var tblue = (blue + 150) % 256;

    return Color.fromRGBO(tred, tgreen, tblue, 1.0);
  }

  /// increase the brightness of current color and return new color
  Color withBrighness(double increaseFactor) {
    int tred = (red * increaseFactor).round().clamp(0, 255);
    int tgreen = (green * increaseFactor).round().clamp(0, 255);
    int tblue = (blue * increaseFactor).round().clamp(0, 255);

    return Color.fromRGBO(tred, tgreen, tblue, 1.0);
  }
}
