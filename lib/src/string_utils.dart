class StringUtils {
  ///
  /// {@tool sample}
  ///
  /// StringUtils.isBlank(null)      = true
  /// StringUtils.isBlank("")        = true
  /// StringUtils.isBlank(" ")       = true
  /// StringUtils.isBlank("bob")     = false
  /// StringUtils.isBlank("  bob  ") = false
  /// {@end-tool}
  ///
  /// @param cs  the CharSequence to check, may be null
  /// @return {@code true} if the CharSequence is null, empty or whitespace
  static bool isBlank(String text) {
    return !isNotBlank(text);
  }

  ///
  /// {@tool sample}
  ///
  /// StringUtils.isNotBlank(null)      = false
  /// StringUtils.isNotBlank("")        = false
  /// StringUtils.isNotBlank(" ")       = false
  /// StringUtils.isNotBlank("bob")     = true
  /// StringUtils.isNotBlank("  bob  ") = true
  /// {@end-tool}
  ///
  /// @param cs  the CharSequence to check, may be null
  /// @return {@code true} if the CharSequence is
  ///  not empty and not null and not whitespace
  static bool isNotBlank(String text) {
    return (text?.trim()?.length ?? 0) > 0;
  }

  static const List TRUE_STRINGS = ["true", "t", "1", "on", "yes", "y", "是"];
  static const List FALSE_STRINGS = ["false", "f", "0", "off", "no", "n", "否", "不", "非"];

  /// convertS string to bool
  static bool toBool(String str, [bool defaultValue = false]) {
    if (isBlank(str)) {
      return defaultValue;
    }
    str = str.trim().toLowerCase();
    if (defaultValue) {
      for (String s in FALSE_STRINGS) {
        if (s == str) {
          return false;
        }
      }
      return true;
    } else {
      for (String s in TRUE_STRINGS) {
        if (s == str) {
          return true;
        }
      }
      return false;
    }
  }
}
