import 'package:flutter_commons_lang/flutter_commons_lang.dart';

void main() {
  ///StringUtils
  String text1 = "  ";
  print(text1.isEmpty);
  print(StringUtils.isBlank(null));
  print(StringUtils.isBlank(""));
  print(StringUtils.isBlank("   "));
  print(StringUtils.isBlank(" b "));

  ///NumberUtils
  print(NumberUtils.getScale(1.12346));
  print(NumberUtils.setScale(1.1246, scale: 2, roundingMode: ROUND_UP));

  int a = NumberUtils.add(1, 2);
  double b = NumberUtils.add(1, 2, returnType: double);
  print(a);
  print(b);

  print("0.2 + 0.1, original:${0.2 + 0.1}, target:${NumberUtils.add(0.2, 0.1)}");
  print("0.3 + 0.6, original:${0.3 + 0.6}, target:${NumberUtils.add(0.3, 0.6)}");
  print("0.3 - 0.2, original:${0.3 - 0.2}, target:${NumberUtils.subtract(0.3, 0.2)}");
  print("0.3 * 1.5, original:${0.3 * 1.5}, target:${NumberUtils.multiply(0.3, 1.5)}");
  print("0.3 / 0.1, original:${0.3 / 0.1}, target:${NumberUtils.divide(0.3, 0.1)}");

  print("1.2354 * 2.365, original:${1.2354 * 2.365}, target:${NumberUtils.multiply(1.2354, 2.365, scale: 2)}");
  print("12354 / 7, original:${12354 / 7}, target:${NumberUtils.divide(12354, 7, scale: 5, roundingMode: ROUND_HALF_UP)}");

  /// DateUtils
  String str = "2018-12-11";
  DateTime time = DateUtils.parse(str);
  print(time);
  print(DateUtils.format(time));
  print(DateUtils.format(time, "yyyy.MM.dd"));

  // 2018-05-01 12:27:35
  DateTime time1 = DateTime(2018, 5, 1, 12, 27, 35);
  DateTime time2 = DateUtils.set(time1, hour: 7);
  print(time1);
  print(time2);

  time1 = DateUtils.today();
  time2 = DateTime.now();
  print(time1);
  print("time2:$time2, year:${time2.year},month:${time2.month},day:${time2.day},weekday:${time2.weekday}");
  print(DateUtils.truncatedEquals(time1, time2, DateUtils.DAY_OF_MONTH));

  DateTime time3 = DateUtils.yesterday();
  DateTime time4 = DateUtils.set(DateTime.now(), year: 2017);
  DateTime time5 = DateUtils.truncate(DateTime.now(), hour: 9, minute: 30);
  print(time3);
  print(time4);
  print(time5);

  print(DateUtils.truncatedEquals(time1, time2, DateUtils.MONTH));
  print(DateUtils.truncatedEquals(time1, time5, DateUtils.DAY_OF_MONTH));
  print(DateUtils.daysOfTheMonth(time1));

  /// ListUtils
  List list = [1, 2, 3, 4, 5];
  String text = ListUtils.listToString(list);
  print(text);
  list = ListUtils.stringToList(text);
  print(list);

  text = ListUtils.listToString(list, ",");
  print(text);
  list = ListUtils.stringToList(text, ",");
  print(list);

  text = ListUtils.listToString(list, ",,");
  print(text);
  // it's error
  // list = ListUtils.stringToList(text, ",,");
  // print(list);
}
