import 'package:flutter/foundation.dart';

Map<String,dynamic> shiftColor({double a, @required int r, @required int g, @required int b, @required double shiftValue}) {
  // if (r == 255 || g == 255 || b == 255) {
  //   return {
  //     'r': r,
  //     'g': g,
  //     'b': b
  //   };
  // } else {
  //   return {
  //     'r': (r * shiftValue).round(),
  //     'g': (g * shiftValue).round(),
  //     'b': (b * shiftValue).round()
  //   };
  // }
  return {
    'a': a * shiftValue / 100,
    'r': r,
    'g': g,
    'b': b
    };
}