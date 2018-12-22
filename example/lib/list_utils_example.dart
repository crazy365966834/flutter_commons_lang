import 'package:flutter_commons_lang/flutter_commons_lang.dart';

void main() {
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
