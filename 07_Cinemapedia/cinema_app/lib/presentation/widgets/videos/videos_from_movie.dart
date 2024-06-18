//Importaciones FLutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/entities.dart';
import 'package:cinema_app/presentation/providers/providers.dart';

// Definición de un proveedor para obtener videos de YouTube relacionados con una película basada en su ID
final FutureProviderFamily<List<Video>, int> videosFromMovieProvider =
    FutureProvider.family((ref, int movieId) {
  // Obtiene una instancia del repositorio de películas desde el proveedor
  final movieRepository = ref.watch(movieRepositoryProvider);
  // Llama al método para obtener videos de YouTube y retorna el resultado
  return movieRepository.getYotubeVideosById(movieId);
});

// Definición de un widget que consume el proveedor de videos de YouTube relacionados con una película
class VideosFromMovie extends ConsumerWidget {
  final int movieId; // ID de la película

  // Constructor
  const VideosFromMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observa el estado del proveedor de videos relacionados con la película
    final moviesFromVideo = ref.watch(videosFromMovieProvider(movieId));

    // Construye la interfaz basada en el estado del proveedor
    return moviesFromVideo.when(
      // Si los datos están disponibles, muestra la lista de videos
      data: (videos) => _VideosList(videos: videos),
      // Si hay un error, muestra un mensaje de error
      error: (_, __) =>
          const Center(child: Text('No se pudo cargar los videos')),
      // Mientras los datos se cargan, muestra un indicador de progreso
      loading: () =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

// Widget para mostrar la lista de videos de YouTube
class _VideosList extends StatelessWidget {
  final List<Video> videos; // Lista de videos

  // Constructor
  const _VideosList({required this.videos});

  @override
  Widget build(BuildContext context) {
    // Si la lista de videos está vacía, retorna un SizedBox vacío
    if (videos.isEmpty) {
      return const SizedBox();
    }

    // Si hay videos, muestra el título y el primer video de la lista
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Videos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        // Muestra sólo el primer video de la lista
        _YouTubeVideoPlayer(
            youtubeId: videos.first.youtubeKey, name: videos.first.name)

        // Si se desean mostrar todos los videos, descomentar el siguiente bloque
        // ...videos.map(
        //   (video) => _YouTubeVideoPlayer(youtubeId: video.youtubeKey, name: video.name)
        // ).toList()
      ],
    );
  }
}

// Widget para reproducir un video de YouTube
class _YouTubeVideoPlayer extends StatefulWidget {
  final String youtubeId; // ID del video de YouTube
  final String name; // Nombre del video

  // Constructor
  const _YouTubeVideoPlayer({required this.youtubeId, required this.name});

  @override
  State<_YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<_YouTubeVideoPlayer> {
  late YoutubePlayerController
      _controller; // Controlador del reproductor de YouTube

  @override
  void initState() {
    super.initState();

    // Inicializa el controlador del reproductor de YouTube con las configuraciones deseadas
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        showLiveFullscreenButton: false,
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    // Dispone del controlador cuando el widget se destruye
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name), // Muestra el nombre del video
            YoutubePlayer(controller: _controller) // Reproductor de YouTube
          ],
        ));
  }
}
