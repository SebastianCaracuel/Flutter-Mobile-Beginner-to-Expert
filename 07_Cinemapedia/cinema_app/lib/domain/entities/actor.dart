//importaciones flutter

//IMportaciones nuestras

//Creamos la entidad de nuestro actor //?Creamos la clase

class Actor {
  //Propiedades de la clase

  final int id;
  final String name;
  final String profilePath;
  final String? character;

  //Constructor con las propiedades
  Actor(
      {required this.id,
      required this.name,
      required this.profilePath,
      required this.character});
}
