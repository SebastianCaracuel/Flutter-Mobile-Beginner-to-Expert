//Creamos la entidad de Videos

//Creamos la clase del modelo del dato de las reglas de negocio

class VideoPost {
  //Parametros
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;

  //Constructor con parametros
  VideoPost({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });
}
