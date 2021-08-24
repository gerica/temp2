import 'package:intl/intl.dart';

class CurrencyHelper {
  CurrencyHelper._();

  static String stringToCurrency(String value, {int decimalDigits = 0}) {
    if (value.isEmpty) return '';
    final num = double.tryParse(value);
    return NumberFormat.currency(decimalDigits: decimalDigits, symbol: '\$').format(num);
  }

  static String intToCurrency(int value, {int decimalDigits = 2}) {
    final roundedValue = (value * 100).truncateToDouble() / 100;
    return NumberFormat.currency(decimalDigits: decimalDigits, symbol: '\$').format(roundedValue);
  }

  static double currencyToDouble(String value, {int decimalDigits = 2}) {
    if (value.isEmpty) return 0;
    return NumberFormat.currency(decimalDigits: decimalDigits, symbol: '\$').parse(value) as double;
  }
}
