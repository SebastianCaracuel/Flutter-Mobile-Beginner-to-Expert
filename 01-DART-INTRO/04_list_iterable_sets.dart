void main() {
  
  //!TODO: TIPOS DE DATOS | LIST | Iterable | Sets
  
  final numbers = [1,2,3,4,5,5,5,6,7,8,8,9,9,10];
  
  print('Lista Original $numbers');
  print ('Largo de la lista ${numbers}');
  print('El N°0 DE LA LISTA : ${numbers[0]}');
  print('El Primer N° de la lista: ${numbers.first}');
  
  //? Vemos como utilizar el Iterable
  //!La diferencia son los parentesis
  //Cuando es un ( ) es un Iterable
  //Cuando es un [ ] es un List
  //Cuando es un { } es un listado pero con valores unicos
  print('La Lista de Forma inversa: ${numbers.reversed}');
  final reversedNumbers = numbers.reversed;
  print('Iterable: $reversedNumbers');
  print('Set: ${reversedNumbers.toSet()}');
  
  //? Para eliminar los datos duplicados utilizamos
  //toSet().toList()
  print('Lista sin duplicados ${numbers.toSet().toList()}');
  
  //!Otra manera de utilizar los Iterables
  final numbersGreaterThan5 = numbers.where ( (int num){
    return num >5;
  });
  print('N°s mayor a 5 : $numbersGreaterThan5');
  //? Pero si mis números estan duplicados?
  //? Utilizamos un toSet()

  print('N° mayor a 5, sin duplicados ${numbersGreaterThan5.toSet()}');
}
