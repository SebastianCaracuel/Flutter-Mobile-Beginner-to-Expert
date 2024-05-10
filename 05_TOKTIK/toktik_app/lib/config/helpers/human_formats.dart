//?Creamos una clase para que el Texto de VideoPost tenga un Formato

import 'package:intl/intl.dart';

class HumanFormats {
  //Propiedad estatica
  static String humanReadbleNumber(double number) {
    //
    final formatterNumber = NumberFormat.compactCurrency(
      //No quiero decimales
      decimalDigits: 0,
      //NO quiero simbolos
      symbol: '',
    ).format(number);

    return formatterNumber;
  }
}
