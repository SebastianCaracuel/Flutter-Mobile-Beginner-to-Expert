import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_app/config/theme/app_theme.dart';
import 'package:toktik_app/infrastructure/datasources/local_video_post_datasource_impl.dart';
import 'package:toktik_app/infrastructure/repository/video_post_repository_impl.dart';
import 'package:toktik_app/presentation/providers/discover_provider.dart';
import 'package:toktik_app/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Creación de Instacia del repositorio y del Datassource
    final videoPostRepository = VideoPostsRepositoryImpl(
        //
        videosDatasource: LocalVideoDatasource());
    //Instanciamos nuestro provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            //Inmediatamente se cree la instancia
            lazy: false,
            //
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
        //Quitamos el Banner de Debug
        debugShowCheckedModeBanner: true,

        //Importamos nuestro theme para la aplicación
        theme: AppTheme().getTheme(),

        //Titulo de la aplicación
        title: 'TOK TIK',

        //Importamos nuestro HomeScreen
        home: const DiscoverScreen(),
      ),
    );
  }
}
