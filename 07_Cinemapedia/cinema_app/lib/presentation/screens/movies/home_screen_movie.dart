//Importaciones de Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:cinema_app/presentation/views/views.dart';

//Creamos la clases
class HomeScreen extends StatefulWidget {
  //Propiedades de la clase
  //?Nombre de la screen
  static const name = 'home_screen';

  //Creamos una nueva propiedad para la vista
  final int pageIndex;

  //Constructor de la clase
  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//todo: Este Mixin es necesario para mantener el estado en el PageView
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  //Propiedades del State

  // Declaración de un controlador de página con inicialización tardía
  late PageController pageController;

// Método que se llama al iniciar el estado del widget
  @override
  void initState() {
    super.initState(); // Llama al método initState de la clase padre

    // Inicializa el PageController, manteniendo la página actual al reconstruir el widget
    pageController = PageController(keepPage: true);
  }

// Método que se llama al destruir el widget y liberar recursos
  @override
  void dispose() {
    // Libera los recursos utilizados por el PageController
    pageController.dispose();

    super.dispose(); // Llama al método dispose de la clase padre
  }

  // Creación de una lista de widgets para las vistas
  final viewRoutes = const <Widget>[
    HomeView(), // Vista principal
    PopularView(), // Vista de las populares
    FavoritesViews(), // Vista de favoritos
  ];

// Método build para construir la interfaz del widget
  @override
  Widget build(BuildContext context) {
    super.build(context); // Llama al método build de la clase padre

    // Si el controlador de página tiene clientes (está inicializado y en uso)
    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex, // Página a la que debe animar
        duration: const Duration(milliseconds: 250), // Duración de la animación
        curve: Curves.easeInOut, // Curva de la animación
      );
    }

    // Construcción de la interfaz de usuario
    return Scaffold(
      // Uso
      body: PageView(
        physics:
            const NeverScrollableScrollPhysics(), // Evita el desplazamiento manual de las páginas
        controller: pageController, // Controlador de la vista de páginas
        children: viewRoutes, // Páginas a mostrar
      ),

      // Barra de navegación inferior personalizada
      bottomNavigationBar: CustomButtomBar(currentIndex: widget.pageIndex),
    );
  }

// Método que indica si el estado del widget debe mantenerse vivo
  @override
  bool get wantKeepAlive => true; // Retorna true para mantener el estado
}
