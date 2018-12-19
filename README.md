# flutter_commons_lang

commons_lang for flutter, provide DateUtils, StringUtils and so on...

## Usage

### DateUtils
```
DateTime time1 = DateUtils.today();
DateTime time2 = DateUtils.today(hour:9);
DateTime time3 = DateUtils.yesterday();
DateTime time4 = DateUtils.set(DateTime.now(), year:2017);
DateTime time5 = DateUtils.zero(DateTime.now(), hour:9, minute:30);
DateUtils.truncatedEquals(time1,time2,DateUtils.MONTH);
DateUtils.truncatedEquals(time1,time5,DateUtils.DAY);
DateUtils.daysOfTheMonth(time1);
```
Output:
> 2018-12-18 00:00:00<br>
> 2018-12-18 09:00:00<br>
> 2018-12-17 00:00:00<br>
> 2017-12-18 14:54:11.763713<br>
> 2018-12-18 09:30:00<br>
> true<br>
> true<br>
> 31<br>

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
