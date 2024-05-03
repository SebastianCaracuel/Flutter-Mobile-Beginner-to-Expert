//Creamos una clase
//?El Objetivo de este class es para tener las propiedades que tiene la url

class YesNoModel {
  String answer;
  bool forced;
  String image;

  //constructor con parametros
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  //?Que es Factory?, cuando alguien llame al constructor con nombre, creará una nueva instancia
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
      answer: json['answer'], forced: json['forced'], image: json['image']);
}
