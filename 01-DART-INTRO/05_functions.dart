

//!TODO: FUNCIONES Y PARAMETROS 


//!Funciones

void main() {
  
 print (  greatEveryone());
 print (  'Suma 1 : ${addTwoNumbers(10,20)}');
 print (  'Suma 2 : ${addTwoNumbers2(10,20)}');
 print('Suma 3 : ${addTwoNumbersOptional(20,30)}');
  
 print('');
 print(greatPerson(name: 'Florencia', message: 'Hi, ') );
}


greatEveryone() =>'Hola a todos!';

//Aca con parametros en llaves { }
int addTwoNumbers ( int a, int b) {
  return a+b;
}

//Aca con parametros de Flecha =>

int addTwoNumbers2 (int a, int b) =>  a+b; 

//Pero y si nuestro b fuera opcional?

int addTwoNumbersOptional ( int a, [int b = 0]){
  //!FORMAS DE HACERLO
  //b = b ?? 0;
  
  return a + b;
}

//!Parametros
  //? Especificar el orden o colocar nombre a los parametros

  String greatPerson({ required String name , String message = 'Hola, '}){
    return '$message Florencia';
  }





