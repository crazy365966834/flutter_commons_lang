import 'package:decimal/decimal.dart';

/// Rounding Modes
///
/// Rounding mode to round away from zero.  Always increments the
/// digit prior to a nonzero discarded fraction.  Note that this rounding
/// mode never decreases the magnitude of the calculated value.
const ROUND_UP = 0;

///
/// Rounding mode to round towards zero.  Never increments the digit
/// prior to a discarded fraction (i.e., truncates).  Note that this
/// rounding mode never increases the magnitude of the calculated value.
const ROUND_DOWN = 1;

///
/// Rounding mode to round towards positive infinity.  If the
/// {@code BigDecimal} is positive, behaves as for
/// {@code ROUND_UP}; if negative, behaves as for
/// {@code ROUND_DOWN}.  Note that this rounding mode never
/// decreases the calculated value.
const ROUND_CEILING = 2;

///
/// Rounding mode to round towards negative infinity.  If the
/// {@code BigDecimal} is positive, behave as for
/// {@code ROUND_DOWN}; if negative, behave as for
/// {@code ROUND_UP}.  Note that this rounding mode never
/// increases the calculated value.
const ROUND_FLOOR = 3;

///
/// Rounding mode to round towards {@literal "nearest neighbor"}
/// unless both neighbors are equidistant, in which case round up.
/// Behaves as for {@code ROUND_UP} if the discarded fraction is
/// &ge; 0.5; otherwise, behaves as for {@code ROUND_DOWN}.  Note
/// that this is the rounding mode that most of us were taught in
/// grade school.
const ROUND_HALF_UP = 4;

///
/// Rounding mode to round towards {@literal "nearest neighbor"}
/// unless both neighbors are equidistant, in which case round
/// down.  Behaves as for {@code ROUND_UP} if the discarded
/// fraction is {@literal >} 0.5; otherwise, behaves as for
/// {@code ROUND_DOWN}.
const ROUND_HALF_DOWN = 5;

///
/// Rounding mode to round towards the {@literal "nearest neighbor"}
/// unless both neighbors are equidistant, in which case, round
/// towards the even neighbor.  Behaves as for
/// {@code ROUND_HALF_UP} if the digit to the left of the
/// discarded fraction is odd; behaves as for
/// {@code ROUND_HALF_DOWN} if it's even.  Note that this is the
/// rounding mode that minimizes cumulative error when applied
/// repeatedly over a sequence of calculations.
const ROUND_HALF_EVEN = 6;

///
/// Rounding mode to assert that the requested operation has an exact
/// result, hence no rounding is necessary.  If this rounding mode is
/// specified on an operation that yields an inexact result, an
/// {@code ArithmeticException} is thrown.
const ROUND_UNNECESSARY = 7;

class NumberUtils {
  /// get the scale of x.
  static getScale(num x) {
    List<String> s = x.toString().split(".");
    return s.length == 2 ? s[1].length : 0;
  }

  static setScale(num x, {scale = -1, roundingMode = ROUND_HALF_UP}) {
    if (x == null || x == 0 || scale < 0) {
      return x;
    }
    if (x.runtimeType == int) {
      return x;
    }
    if (scale >= getScale(x)) {
      return x;
    }

    int temp = int.parse("1".padRight(scale + 1, "0"));
    num r = x * temp;
    if (roundingMode == ROUND_UP) {
      if (x < 0) {
        return r.floor() / temp;
      } else {
        return r.ceil() / temp;
      }
    } else if (roundingMode == ROUND_DOWN) {
      if (x > 0) {
        return r.floor() / temp;
      } else {
        return r.ceil() / temp;
      }
    } else if (roundingMode == ROUND_CEILING) {
      return r.ceil() / temp;
    } else if (roundingMode == ROUND_FLOOR) {
      return r.floor() / temp;
    } else if (roundingMode == ROUND_HALF_UP) {
      return r.round() / temp;
    } else if (roundingMode == ROUND_HALF_DOWN) {
      if (r - r.floor() > 0.5) {
        return (r + 1).floor() / temp;
      }
      return r.floor() / temp;
    } else if (roundingMode == ROUND_HALF_EVEN) {
      return x;
    } else if (roundingMode == ROUND_UNNECESSARY) {
      throw new Exception("Rounding necessary");
    } else {
      throw new Exception("Invalid rounding mode");
    }
  }

  /// return x + b
  /// scale is invalid when the value of x+y is int
  static num add(x, y, {scale = -1, roundingMode = ROUND_HALF_UP, returnType}) {
    Decimal a = Decimal.parse(x.toString());
    Decimal b = Decimal.parse(y.toString());
    Decimal c = a + b;
    num z = num.parse(c.toString());
    if (scale >= 0) {
      z = setScale(z, scale: scale, roundingMode: returnType);
    }

    if (returnType == double) {
      return z.toDouble();
    } else if (returnType == int) {
      return z.toInt();
    }
    return z;
  }

  /// return x - b
  static subtract(x, y, {scale = -1, roundingMode = ROUND_HALF_UP, returnType}) {
    Decimal a = Decimal.parse(x.toString());
    Decimal b = Decimal.parse(y.toString());
    Decimal c = a - b;
    num z = num.parse(c.toString());
    if (scale >= 0) {
      z = setScale(z, scale: scale, roundingMode: returnType);
    }

    if (returnType == double) {
      return z.toDouble();
    } else if (returnType == int) {
      return z.toInt();
    }
    return z;
  }

  /// return x * b
  static multiply(x, y, {scale = -1, roundingMode = ROUND_HALF_UP, returnType}) {
    Decimal a = Decimal.parse(x.toString());
    Decimal b = Decimal.parse(y.toString());
    Decimal c = a * b;
    num z = num.parse(c.toString());
    if (scale >= 0) {
      z = setScale(z, scale: scale, roundingMode: roundingMode);
    }

    if (returnType == double) {
      return z.toDouble();
    } else if (returnType == int) {
      return z.toInt();
    }
    return z;
  }

  /// return x / b
  static divide(x, y, {scale = -1, roundingMode = ROUND_HALF_UP, returnType}) {
    Decimal a = Decimal.parse(x.toString());
    Decimal b = Decimal.parse(y.toString());
    Decimal c = a / b;
    num z = num.parse(c.toString());
    if (scale >= 0) {
      z = setScale(z, scale: scale, roundingMode: roundingMode);
    }

    if (returnType == double) {
      return z.toDouble();
    } else if (returnType == int) {
      return z.toInt();
    }
    return z;
  }

  /// return x % b
  /// the returnType must be int.
  static remainder(x, y, {scale = -1, roundingMode = ROUND_HALF_UP}) {
    Decimal a = Decimal.parse(x.toString());
    Decimal b = Decimal.parse(y.toString());
    Decimal c = a % b;
    return int.parse(c.toString());
  }
}
