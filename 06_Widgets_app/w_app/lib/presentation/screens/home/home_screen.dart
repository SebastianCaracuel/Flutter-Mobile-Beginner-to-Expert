import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_app/config/menu/menu_items.dart';
import 'package:w_app/presentation/providers/theme_provider.dart';
import 'package:w_app/presentation/widgets/side_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  //Creamos una propiedad estatica
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Propiedad
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      //Referencia al estado actual del scaffold
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),

        //Creamos el icono de MODE light and mode Dark
        actions: [
          IconButton(
              //Función
              onPressed: () {
                //Llamamos a la referencia para poder cambiar nuestro mode a oscuro
                ref //Llamamos a la referencia
                    .read //Leemos la referencia
                    (isDarkModeProvider
                        .notifier) // Llamamos a nuestra referencia con un notifier
                    .update((isDarMode) => //utilizamos el update para hacerlo mas facil
                        !isDarkMode); //El state va a ser un bool y esto es igual a distinto de nuestro state
              },
              //Iconos
              icon: Icon(isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded)),
          //icon: const Icon(Icons.dark_mode_rounded)),
        ],
      ),

      //Cuerpo de nuestro scaffold
      //Importamos nuestro WIdget privado( es privado porque utiliza _ )
      body: const _HomeView(),

      //Utilizamos el Drawer para menu lateral
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

//Creamos un widget aparte para la vista de nuestra pantalla o cuerpo. Eso es para no tener un widget tan extenso y nuestro codigo pueda mantenerse en un futuro.
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    //Llamamos a nuestro

    return ListView.builder(
      //COlocamos un scroll y rebote
      physics: const BouncingScrollPhysics(),
      //Este itemcount representa los datos que tenemos en nuestro menu
      itemCount: appMenuItems.length,
      //Llamamos a nuestro menu y sus datos.
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

//Creamos un Widget personalizado para el contenido en la Lista.
class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    //Llamamos a nuestra clase de temas y estilos
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      //Colocamos a nuestros items y le colocamos el color que tenemos asignado
      leading: Icon(menuItem.icon, color: colors.primary),
      //Icono que colocaremos al final
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      //Llamamos a nuestro titulo
      title: Text(menuItem.title),
      //Llamamos a nuestro subtitulo
      subtitle: Text(menuItem.subTitle),
      //Colocamos el OnTap para que se pueda realizar el gesto de "presionar"
      onTap: () {
        //todo:NAVEGACIÓN NORMAL ENTRE PANTALLAS
        //?Navigator.pushNamed(context, menuItem.link);

        //Navegación entre pantallas por nombre
        //?context.pushNamed(CardsScreen.name);

        //Llamamos a nuestra ruta ahora con el Go_router implementado
        context.push(menuItem.link);
      },
    );
  }
}
