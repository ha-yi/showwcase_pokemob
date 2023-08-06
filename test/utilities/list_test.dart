import 'package:flutter_test/flutter_test.dart';

import 'package:showwcase_pokemob/utilities/list.ext.dart';

void main() {
  test('firstOrNull should return the first element of a non-empty list', () {
    List<int> numbers = [1, 2, 3, 4, 5];
    int? firstNumber = numbers.firstOrNull();

    expect(firstNumber, equals(1));
  });

  test('firstOrNull should return null for an empty list', () {
    List<int> emptyList = [];
    int? firstNumber = emptyList.firstOrNull();

    expect(firstNumber, isNull);
  });
}
