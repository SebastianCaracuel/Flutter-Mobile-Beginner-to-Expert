//Importaciones flutter
import 'package:intl/intl.dart';

//Importaciones nuestras

//Creamos una clase que nos permita visualizar formatos númericos - humanamente posibles
class HumanFormats {
  // Definimos un método estático llamado number que toma un número de tipo double
  // y opcionalmente un entero que representa la cantidad de decimales (por defecto es 0)
  static String number(double number, [int decimals = 0]) {
    //Llamamos al paquete Intl
    final formattedNumber = NumberFormat.compactCurrency(
      //Realizamos la configuración de compo queremos el formato

      //?Numeros decimales en 0, porque no queremos
      decimalDigits: decimals,
      //?Que no tenga simbolos
      symbol: '',
      //?El idioma local - En este caso utilizarémos ingles.
      locale: 'en',
    ).format(number);

    //Retornamos
    return formattedNumber;
  }
}
