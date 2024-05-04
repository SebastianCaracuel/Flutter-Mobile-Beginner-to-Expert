//creamos una clase de modelo da datos para los videos
//logica de negocio

class VideoPost {
  //Creamos los parametros
  final String caption;
  final String videoUrL;
  final int likes;
  final int views;

  //Creamos el Constructor de la clase
  VideoPost({
    required this.caption,
    required this.videoUrL,
    this.likes = 0,
    this.views = 0,
  });
}
