import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:showwcase_pokemob/utilities/color.ext.dart';

void main() {
  test('getDifferentColor should return a different color', () {
    Color originalColor = Colors.red;
    Color differentColor = originalColor.getDifferentColor();

    expect(differentColor, isNot(originalColor));
  });

  test('withBrightness should increase the color brightness', () {
    Color originalColor = Colors.purple.shade700;
    Color differentColor = originalColor.withBrighness(1.2);

    expect(differentColor, isNot(originalColor));

    expect(differentColor.red, greaterThan(originalColor.red));
    expect(differentColor.green, greaterThan(originalColor.green));
    expect(differentColor.blue, greaterThan(originalColor.blue));
  });
}
