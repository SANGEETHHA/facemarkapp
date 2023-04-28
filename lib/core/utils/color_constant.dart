import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color whiteA700B2 = fromHex('#b2ffffff');

  static Color blueGray10001 = fromHex('#d9d9d9');

  static Color teal300Ce = fromHex('#ce39acbd');

  static Color gray50 = fromHex('#fcfcfc');

  static Color teal300 = fromHex('#3aadbd');

  static Color black90001 = fromHex('#000000');

  static Color black900Dd = fromHex('#dd000000');

  static Color black900 = fromHex('#0c0c0c');

  static Color whiteA70059 = fromHex('#59ffffff');

  static Color black901 = fromHex('#000000');

  static Color blueGray700 = fromHex('#4e4e53');

  static Color blueGray900 = fromHex('#303132');

  static Color redA700 = fromHex('#ff0000');

  static Color blueGray100 = fromHex('#d8dadc');

  static Color gray500 = fromHex('#979797');

  static Color orangeA200 = fromHex('#ffa84a');

  static Color gray900 = fromHex('#232326');

  static Color gray200 = fromHex('#e8e8e8');

  static Color gray100 = fromHex('#f2f2f2');

  static Color whiteA70066 = fromHex('#66ffffff');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color black90099 = fromHex('#99000000');

  static Color black900Cc = fromHex('#cc000000');

  static Color black90094 = fromHex('#94010f07');

  static Color bluegray400 = fromHex('#888888');

  static Color indigo900 = fromHex('#243465');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
