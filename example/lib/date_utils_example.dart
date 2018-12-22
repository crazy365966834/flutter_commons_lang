import 'package:flutter_commons_lang/flutter_commons_lang.dart';

void main() {
  String str = "2018-12-11";
  DateTime time = DateUtils.parse(str);
  print(time);
  print(DateUtils.format(time));
  print(DateUtils.format(time, format: "yyyy.MM.dd"));

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
}
