import 'package:flutter_commons_lang/flutter_commons_lang.dart';

void main() {
  String text1 = "  ";
  print(text1.isEmpty);
  print(StringUtils.isBlank(null));
  print(StringUtils.isBlank(""));
  print(StringUtils.isBlank("   "));
  print(StringUtils.isBlank(" b "));
}
