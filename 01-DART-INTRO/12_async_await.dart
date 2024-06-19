//!TODO FUTURE | Awaits | async
void main() async{
  print('Inicio del programa');
  print('');
  
  
  //Try
  try{
    //Llamamos al future
 final value = await httpGet('https://fernando-herrera.com');
    print(value);
  }catch (err){
    print('Tenemos un error: $err');
  }
  
  
      
  print('');
  print('Fin del programa');
}


//!TODO Utilizamos el async 
Future <String> httpGet(String url) async {
  
  //AWAIT
  //Le damos una duracion de 1 segundo para que nos muestre el mensaje
  await Future.delayed(const Duration(seconds: 1));
       //Manejamos Excepciones de errores
      throw 'Error en la peticion HTPP';
  
     //return 'Tenemos un valor de la petición';
   
   
  
  
  
  

}