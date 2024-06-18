//Creamos una entidad para los videos o trailers de las películas

class Video {
  //Propiedades

  final String id;
  final String name;
  final String youtubeKey;
  final DateTime publishedAt;

  //Constructor con las propiedades
  Video(
      {required this.id,
      required this.name,
      required this.youtubeKey,
      required this.publishedAt});
}
