//Importaciones flutter

//Importaciones nuestras

//clase Mapper (Crear una película basado en algún objeto que vamos a recibir.)
import 'package:cinema_app/domain/entities/entities.dart';
import 'package:cinema_app/infrastructure/models/models.dart';

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
          : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
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
          : 'https://www.movienewz.com/img/films/poster-holder.jpg',
      //
      releaseDate:
          moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
      //
      title: moviedb.title,
      //
      video: moviedb.video,
      //
      voteAverage: moviedb.voteAverage,
      //
      voteCount: moviedb.voteCount);

//Creamos un nuevo mapeo para el detalle de las películas y podamos realizar un llamado JSON
  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
      //
      adult: moviedb.adult,
      //La imagen que trae la película -  si no trae imagen buscamos una imagen de google y la colocamos
      backdropPath: (moviedb.backdropPath != '')
          //Explicamos que debe llamar a nuestra imagen
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          //Si no tiene imagen llamamos una de google
          : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      //
      genreIds: moviedb.genres.map((e) => e.name).toList(),
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
          : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
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
