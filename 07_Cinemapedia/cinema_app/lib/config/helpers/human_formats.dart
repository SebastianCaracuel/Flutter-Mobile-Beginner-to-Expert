//Importaciones flutter
import 'package:intl/intl.dart';

//Importaciones nuestras

//Creamos una clase que nos permita visualizar formatos númericos - humanamente posibles
class HumanFormats {
  // Definimos un método estático llamado number que toma un número de tipo double
  // y opcionalmente un entero que representa la cantidad de decimales (por defecto es 0)
  static String number(double number, [int decimals = 0]) {
    //Llamamos al paquete Intl
    return NumberFormat.compactCurrency(
      //Realizamos la configuración de compo queremos el formato

      //?Numeros decimales en 0, porque no queremos
      decimalDigits: decimals,
      //?Que no tenga simbolos
      symbol: '',
      //?El idioma local - En este caso utilizarémos ingles.
      locale: 'en',
    ).format(number);
  }

  // Define una función estática llamada 'shortDate' que toma un objeto 'DateTime' como parámetro
  static String shortDate(DateTime date) {
    // Crea un formato de fecha específico utilizando la clase 'DateFormat'
    // 'yMMMEd' significa: año, mes abreviado y día de la semana
    // 'es' indica que el formato de fecha será en español
    final format = DateFormat.yMMMEd('en_US');

    // Formatea la fecha proporcionada según el formato especificado y la devuelve como una cadena
    return format.format(date);
  }
}
