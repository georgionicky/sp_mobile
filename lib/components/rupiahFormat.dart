// ignore_for_file: file_names

import 'package:intl/intl.dart';

class RupiahFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp. ',
      decimalDigits: decimalDigit,
    );

    return currencyFormatter.format(int.parse(number));
  }
}
