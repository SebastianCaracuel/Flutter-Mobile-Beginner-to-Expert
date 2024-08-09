//?En este archivo recibiremos el JSON

//Importaciones Flutter

//Importaciones nuestras
import 'package:teslo_shop_app/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        fullName: json['fullName'],
        roles: List<String>.from(json['roles'].map((role) => role)),
        token: json['token'],
      );
}