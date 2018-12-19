class DateUtils {
  /// Number of milliseconds in a standard second.
  static const int MILLIS_PER_SECOND = 1000;

  /// Number of milliseconds in a standard minute.
  static const int MILLIS_PER_MINUTE = 60 * MILLIS_PER_SECOND;

  /// Number of milliseconds in a standard hour.
  static const int MILLIS_PER_HOUR = 60 * MILLIS_PER_MINUTE;

  /// Number of milliseconds in a standard day.
  static const int MILLIS_PER_DAY = 24 * MILLIS_PER_HOUR;

  // Weekday constants that are returned by [weekday] method:
  static const int YEAR = 1;
  static const int MONTH = 2;
  static const int DAY = 3;
  static const int HOUR = 4;
  static const int MINUTE = 5;
  static const int SECOND = 6;
  static const int MILLISECOND = 7;
  static const int MICROSECOND = 8;

  /// return today's 00:00:00
  /// also return today's hour:minute:second
  static DateTime today({hour: -1, minute: -1, second: -1, millisecond: -1, microsecond: -1}) {
    DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      hour >= 0 ? hour : 0,
      minute >= 0 ? minute : 0,
      second >= 0 ? second : 0,
      millisecond >= 0 ? millisecond : 0,
      microsecond >= 0 ? microsecond : 0,
    );
  }

  /// return yesterday's 00:00:00
  /// also return today's hour:minute:second
  static DateTime yesterday({hour: -1, minute: -1, second: -1, millisecond: -1, microsecond: -1}) {
    DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day - 1,
      hour >= 0 ? hour : 0,
      minute >= 0 ? minute : 0,
      second >= 0 ? second : 0,
      millisecond >= 0 ? millisecond : 0,
      microsecond >= 0 ? microsecond : 0,
    );
  }

  static DateTime beginOfTheDate(DateTime time) {
    return DateTime(time.year, time.month, time.day);
  }

  ///
  /// to set the value of the field , keep value of the other field
  static DateTime set(DateTime time, {year: -1, month: -1, day: -1, hour: -1, minute: -1, second: -1, millisecond: -1, microsecond: -1}) {
    assert(time != null);
    return DateTime(
      year >= 0 ? year : time.year,
      month >= 0 ? month : time.month,
      day >= 0 ? day : time.day,
      hour >= 0 ? hour : time.hour,
      minute >= 0 ? minute : time.minute,
      second >= 0 ? second : time.second,
      millisecond >= 0 ? millisecond : time.millisecond,
      microsecond >= 0 ? microsecond : time.microsecond,
    );
  }

  ///
  /// set the value of the field and zero the value after the field
  /// truncate (hour: 9) 将返回 yyyy-MM-dd 09:00:00
  /// truncate (hour: 9, minute: 30) 将返回 yyyy-MM-dd 09:30:00
  static DateTime truncate(DateTime time, {year: -1, month: -1, day: -1, hour: -1, minute: -1, second: -1, millisecond: -1, microsecond: -1}) {
    assert(time != null);
    return DateTime(
      year >= 0 ? year : time.year,
      month >= 0 ? month : year >= 0 ? 1 : time.month,
      day >= 0 ? day : month >= 0 ? 1 : time.day,
      hour >= 0 ? hour : day >= 0 ? 0 : time.hour,
      minute >= 0 ? minute : hour >= 0 ? 0 : time.minute,
      second >= 0 ? second : minute >= 0 ? 0 : time.second,
      millisecond >= 0 ? millisecond : second >= 0 ? 0 : time.millisecond,
      microsecond >= 0 ? microsecond : millisecond > 0 ? 0 : time.microsecond,
    );
  }

  ///
  /// Determines if two dates are equal up to no more than the specified
  /// most significant field.
  /// @param date1 the first date, not null
  /// @param date2 the second date, not null
  /// @param field the field as [YEAR,MONTH,DAY ...]
  /// @return true if equal; otherwise false
  static bool truncatedEquals(DateTime time1, DateTime time2, int field) {
    if (time1 == null && time2 == null) {
      return true;
    }
    if (time1 == null || time2 == null) {
      return false;
    }
    bool equals;
    equals = time1.year == time2.year;
    if (equals == false || field == YEAR) {
      return equals;
    }
    equals = time1.month == time2.month;
    if (equals == false || field == MONTH) {
      return equals;
    }
    equals = time1.day == time2.day;
    if (equals == false || field == DAY) {
      return equals;
    }
    equals = time1.hour == time2.hour;
    if (equals == false || field == HOUR) {
      return equals;
    }
    equals = time1.minute == time2.minute;
    if (equals == false || field == MINUTE) {
      return equals;
    }
    equals = time1.second == time2.second;
    if (equals == false || field == SECOND) {
      return equals;
    }
    equals = time1.millisecond == time2.millisecond;
    if (equals == false || field == MILLISECOND) {
      return equals;
    }
    equals = time1.microsecond == time2.microsecond;
    return equals;
  }

  static const List<int> _leapYearMonths = <int>[1, 3, 5, 7, 8, 10, 12];

  /// return the days of the time.month
  static int daysOfTheMonth(DateTime time) {
    assert(time != null);
    if (_leapYearMonths.contains(time.month)) {
      return 31;
    } else if (time.month == 2) {
      if ((time.year % 4 == 0 && time.year % 100 != 0) || time.year % 400 == 0) {
        return 29;
      }
      return 28;
    }
    return 30;
  }
}
