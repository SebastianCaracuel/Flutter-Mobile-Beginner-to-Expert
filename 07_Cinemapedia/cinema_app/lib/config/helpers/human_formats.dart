//Importaciones flutter
import 'package:intl/intl.dart';

//Importaciones nuestras

//Creamos una clase que nos permita visualizar formatos númericos - humanamente posibles
class HumanFormats {
  //Metodo
  static String number(double number) {
    //Llamamos al paquete Intl
    final formattedNumber = NumberFormat.compactCurrency(
      //Realizamos la configuración de compo queremos el formato

      //?Numeros decimales en 0, porque no queremos
      decimalDigits: 0,
      //?Que no tenga simbolos
      symbol: '',
      //?El idioma local - En este caso utilizarémos ingles.
      locale: 'en',
    ).format(number);

    //Retornamos
    return formattedNumber;
  }
}
