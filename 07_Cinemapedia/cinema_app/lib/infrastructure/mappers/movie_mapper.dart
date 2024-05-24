//Importaciones flutter

//Importaciones nuestras

//clase Mapper (Crear una película basado en algún objeto que vamos a recibir.)
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  //propiedades

  //?Propiedad sin necesidad de instanciar la clase - static
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      //
      adult: moviedb.adult,
      //La imagen que trae la película -  si no trae imagen buscamos una imagen de google y la colocamos
      backdropPath: (moviedb.backdropPath != '')
          //Explicamos que debe llamar a nuestra imagen
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          //Si no tiene imagen llamamos una de google
          : 'https://th.bing.com/th/id/OIP.Lr_j_PgqTGzKxJTeIwajVwHaLH?rs=1&pid=ImgDetMain',
      //
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      //
      id: moviedb.id,
      //
      originalLanguage: moviedb.originalLanguage,
      //
      originalTitle: moviedb.originalTitle,
      //
      overview: moviedb.overview,
      //
      popularity: moviedb.popularity,
      //Realizamos lo mismo de la imagen.
      posterPath: (moviedb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : 'NO-POSTER',
      //
      releaseDate: moviedb.releaseDate,
      //
      title: moviedb.title,
      //
      video: moviedb.video,
      //
      voteAverage: moviedb.voteAverage,
      //
      voteCount: moviedb.voteCount);
}
