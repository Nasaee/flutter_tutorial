import 'package:intl/intl.dart';

String getFormattedDateTime(num dt, [String pattern = 'yyy-MM-dd']) {
  return DateFormat(
    pattern,
  ).format(DateTime.fromMillisecondsSinceEpoch(dt.toInt()));
}
