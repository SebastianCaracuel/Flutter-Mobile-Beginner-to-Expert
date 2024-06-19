//!TODO TRY CATCH
void main() async{
  print('Inicio del programa');
  print('');
  
  
  //Try
  try{
    //Llamamos al future
 final value = await httpGet('https://fernando-herrera.com');
    //Si todo funciona correctamente tenemos el valro
    print( 'Exito : $value');
    
    // ? ON
    //? me permite reaccionar basado en la excepcion que recibamos
  } on Exception catch (err){
       print('Tenemos una Excepcion : $err');
    
    
   //En caso de error
  }catch (err){
    print('Opp! No Existen datos!: $err');
    
    //En caso de que funciono o no todo
    //Estará el finally
    
  }finally{
    print('Fin del try y catch');
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
     
      throw Exception('No hay parametros en el Url');
      
  
      //throw 'Error en la peticion HTPP';
  
     //return 'Tenemos un valor de la petición';
   
}