//La respuesta de la petición

//Creamos una clase
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //Creamos una nueva propiedad, una propiedad privada
  final _dio = Dio();

  //Creamos un metodo
  Future<Message> getAnswer() async {
    //Llamamos al URL
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //Transformamos la instancia del message
    return yesNoModel.toMessageEntity();
  }
}
