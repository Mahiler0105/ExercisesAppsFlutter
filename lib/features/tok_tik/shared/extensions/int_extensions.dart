import 'package:intl/intl.dart';

extension IntExtensions on int {
  String toHumanReadable () {
    return NumberFormat.compactCurrency(
      decimalDigits: 0, symbol: ''
    ).format(toDouble());
  }
}
