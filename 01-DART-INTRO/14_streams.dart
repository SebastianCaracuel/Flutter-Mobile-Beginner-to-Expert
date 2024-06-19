
//!TODO STREAMS

void main(){
  
  emitNumbers().listen( (value) {
     print ('Stream value: $value');
  });
  
}



//Creamos una funcion
Stream<int> emitNumbers(){
  
  //Este es un Stream que emite valores numericos infinitos
  //Hasta que uno lo detenga o planee un formato de detencion
  return Stream.periodic( const Duration(seconds: 1), (value) {
    //print('desde periodic $value');
    return value;
    
    //Si quiero que el string emita 5 valores
    //Se debe realizar un take - toma tantos valores y luego cierrate
  }).take(5);
}