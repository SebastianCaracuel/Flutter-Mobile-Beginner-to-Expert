//? Creamos a nuestro usuario
class User {
  //Propiedades del usuario
  final String id;
  final String email;
  final String fullName;
  final List<String> roles;
  final String token;

  //Constructor
  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.roles,
    required this.token,
  });

  //? Identificamos si es administrador con una variable booleana
  bool get isAdmin {
    return roles.contains('admin');
  }
}
