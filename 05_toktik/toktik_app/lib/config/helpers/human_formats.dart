//Creamos una clase de Formato "Humano"

import 'package:intl/intl.dart';

class HumanFormats {
  //Tendrá una variable estatica llamdada lectura de numeros humanos?

  //Lo colocamos estatico para que no tengamos que una llamada de instancia
  static String humanReadbleNumber(double number) {
    // utilizamos el paquete intl
    final formatterNumer =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(number);
    return formatterNumer;
  }
}
