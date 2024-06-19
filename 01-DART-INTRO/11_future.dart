//!TODO FUTURE
void main (){
  print('Inicio del programa');
  print('');
  
  
  httpGet('https://fernando-herrera.com').then( (value) {
    print(value);
    //Para manejar el error en nuestro future
  }).catchError ( (err) {
      print('error : $err');
  });
  
    
  
  print('');
  print('Fin del programa');
}

Future <String> httpGet(String url){
  return Future.delayed(const Duration(seconds: 1), () {
    //Manejamos Excepciones
    throw 'Error en la peticion HTPP';
    
    
    //return 'Respuesta de la pteicion http';
  
  });
}