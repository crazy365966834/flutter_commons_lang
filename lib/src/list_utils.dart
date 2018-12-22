class ListUtils {
  /// 默认情况下值为null的表示字符
  static const DEFAULT_NULL = '~';

  /// 集合与字符串转换时，默认情况下集合元素之间的分隔字符。
  static const DEFAULT_SEPARATOR = ';';

  /// 集合与字符串转换时，默认情况下的转义字符
  static const DEFAULT_ESCAPE = '\\';

  ///
  ///  merge all item as a new List, ignore null items.
  ///  if the item is a list, merge list's items.
  static List merge([item1, item2, item3, item4, item5, item6, item7, item8, item9, item10]) {
    List list = [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10];
    List result = List();
    for (Object item in list) {
      if (item != null) {
        if (item.runtimeType == List) {
          result.addAll(item);
        } else {
          result.add(item);
        }
      }
    }
    return result;
  }

  ///  convert the List to string, auto toString
  ///  if you wan't to use stringToList after a while, the length of separator must be 1.
  static String listToString(List list, [String separator = DEFAULT_SEPARATOR, String escape = DEFAULT_ESCAPE]) {
    if (separator == escape) {
      throw new Exception("separator and escape must be different");
    }
    if (list == null) return null;

    StringBuffer sb = new StringBuffer();
    for (Object item in list) {
      if (sb.length > 0) {
        sb.write(separator);
      }
      if (item == null) {
        sb.write(DEFAULT_NULL);
      } else {
        _encode(sb, item.toString(), escape, [separator, DEFAULT_NULL]);
      }
    }
    return sb.toString();
  }

  ///  convert the string to list<String>
  static List<String> stringToList(String str, [String separator = DEFAULT_SEPARATOR, String escape = DEFAULT_ESCAPE]) {
    if (separator == escape) {
      throw new Exception("separator and escape must be different");
    }
    if (separator.length > 1) {
      throw new Exception("length of separator must be 1");
    }

    if (str == null) return null;

    List<String> list = new List<String>();
    StringBuffer word = new StringBuffer();
    bool escapeOn = false;
    for (int code in str.codeUnits) {
      String char = String.fromCharCode(code);
      if (char == escape) {
        if (escapeOn) {
          word.write(escape);
          escapeOn = false;
        } else {
          escapeOn = true;
        }
      } else if (char == DEFAULT_NULL) {
        if (escapeOn) {
          word.write(DEFAULT_NULL);
          escapeOn = false;
        } else {
          word.write(DEFAULT_NULL);
        }
      } else if (char == separator) {
        if (escapeOn) {
          word.write(separator);
          escapeOn = false;
        } else {
          list.add(_toStringNullSafe(word));
          word = new StringBuffer();
        }
      } else {
        word.write(char);
      }
    }
    if (word.length > 0) {
      list.add(_toStringNullSafe(word));
    }
    return list;
  }

  static _encode(StringBuffer sb, String input, String escape, List<String> reservedChars) {
    for (int code in input.codeUnits) {
      String char = String.fromCharCode(code);
      if (char == escape) {
        sb.write(escape);
      } else {
        bool reserved = false;
        for (String rc in reservedChars) {
          if (rc == char) {
            reserved = true;
            break;
          }
        }
        if (reserved) {
          sb.write(escape);
        }
      }
      sb.write(char);
    }
  }

  static String _toStringNullSafe(StringBuffer sb) {
    String str = sb.toString();
    if (DEFAULT_NULL == str)
      return null;
    else
      return str;
  }
}
