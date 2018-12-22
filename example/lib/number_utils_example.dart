import 'package:flutter_commons_lang/flutter_commons_lang.dart';

void main() {
  print(NumberUtils.getScale(1.12346));
  print(NumberUtils.setScale(1.1246, scale: 2, roundingMode: ROUND_UP));

  print("0.2 + 0.1, original:${0.2 + 0.1}, target:${NumberUtils.add(0.2, 0.1)}");
  print("0.3 + 0.6, original:${0.3 + 0.6}, target:${NumberUtils.add(0.3, 0.6)}");
  print("0.3 - 0.2, original:${0.3 - 0.2}, target:${NumberUtils.subtract(0.3, 0.2)}");
  print("0.3 * 1.5, original:${0.3 * 1.5}, target:${NumberUtils.multiply(0.3, 1.5)}");
  print("0.3 / 0.1, original:${0.3 / 0.1}, target:${NumberUtils.divide(0.3, 0.1)}");

  print("1.2354 * 2.365, original:${1.2354 * 2.365}, target:${NumberUtils.multiply(1.2354, 2.365, scale: 2)}");
  print("12354 / 7, original:${12354 / 7}, target:${NumberUtils.divide(12354, 7, scale: 5, roundingMode: ROUND_HALF_UP)}");
}
