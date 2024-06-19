void main() {
  //?Tipos de datos | String | int | bool

  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool estaVivo = true;

  //?Tipos de Datos | Listado

  final habilidades = ['impostor'];
  final imagen = ['ditto/front.png', 'ditto/back.png'];

  //!Otras manera de hacerlo, especificando el Tipo de Dato
  //! final habilidades = <String> ['impostor'];
  //! final List<String> habilidades = ['impostor'];

  // ?Tipos de Datos | Dynamic
  //!:Dynamic == null / acepta valores nulos
  //!:Cualquier valor va a ser permitido en dynamic
  //!:Hay que ser cuidadosos de donde utilizar dynamic
  dynamic errorMessage = 'hola';
  errorMessage = true;
  errorMessage = [1, 2, 3, 4, 5];
  errorMessage = {1, 2, 3, 4, 5};
  errorMessage = () => true;
  errorMessage = null;



  //?LO QUE LE HACE REFERENCIA EL """
  //? LO QUE COLOQUEMOS AHÍ SERÁ
  //?MULTILINEA

  print(""" 
  $pokemon
  $hp
  $estaVivo
  $habilidades
  $imagen
  $errorMessage
  """);
}
