import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),

      //Cuerpo de nuestro scaffold

      //Importamos nuestro WIdget privado( es privado porque utiliza _ )
      body: const _HomeView(),
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
        //Navigator.pushNamed(context, menuItem.link);

        //Llamamos a nuestra ruta ahora con el Go_router implementado
        context.push(menuItem.link);
      },
    );
  }
}
