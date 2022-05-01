import 'package:intl/intl.dart';

class Util {
  static String appId = "e9596aab577364f106c05db42fe228f5";

  static String dateFormatted(DateTime dateTime) {
    return new DateFormat('EEEE, MMM d, y').format(dateTime);
  }
}
