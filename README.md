# flutter_commons_lang

commons_lang for flutter, provide DateUtils, StringUtils and so on...

## Usage

### NumberUtils
provider add/subtract/multiple/divide to safe calculate with scale,keep param's runtimeType or custom to returnType.

```
NumberUtils.getScale(1.12346);
NumberUtils.setScale(1.1246, scale: 2, roundingMode: ROUND_UP);

NumberUtils.add(0.2, 0.1);
NumberUtils.add(0.3, 0.6);
NumberUtils.subtract(0.3, 0.2);
NumberUtils.multiply(0.3, 1.5);
NumberUtils.divide(0.3, 0.1);

NumberUtils.multiply(1.2354, 2.365, scale: 2);
NumberUtils.divide(12354, 7, scale: 5, roundingMode: ROUND_HALF_UP);
```

### StringUtils
provider some easy op.

```
print(StringUtils.isBlank(null));
print(StringUtils.isBlank(""));
print(StringUtils.isBlank("   "));
print(StringUtils.isBlank(" b "));
```

### ListUtils
provider the convert of list to string and string to list.

```
  List list = [1, 2, 3, 4, 5];
  String text = ListUtils.listToString(list);
  list = ListUtils.stringToList(text);
  text = ListUtils.listToString(list, ",");
  list = ListUtils.stringToList(text, ",");
```

### DateUtils
easy to op datetime.
as today, yesterday
as set hour,set day
as truncate
as daysOfTheMonth

```
DateTime time = DateUtils.parse("2018-12-11");
DateUtils.format(time);
DateUtils.format(time, format: "yyyy.MM.dd");

DateTime time1 = DateUtils.today();
DateTime time2 = DateUtils.today(hour:9);
DateTime time3 = DateUtils.yesterday();
DateTime time4 = DateUtils.set(DateTime.now(), year:2017);
DateTime time5 = DateUtils.truncate(DateTime.now(), hour:9, minute:30);
DateUtils.truncatedEquals(time1,time2,DateUtils.MONTH);
DateUtils.truncatedEquals(time1,time5,DateUtils.DAY);
DateUtils.daysOfTheMonth(time1);
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.io/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
