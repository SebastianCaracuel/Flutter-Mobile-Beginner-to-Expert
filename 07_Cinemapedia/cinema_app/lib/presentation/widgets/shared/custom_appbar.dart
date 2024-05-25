//Importaciones Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras

//?Creamos un Appbar personalizado
class CustomAppbar extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const CustomAppbar({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //?Llamamos el color que asignamos en nuestro tema para la aplicación
    final colors = Theme.of(context).colorScheme;

    //?Le asignamos un estilo al titulo
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    //Creamos un SafeArea para que nuestro AppBar no choque con el Notch
    return SafeArea(
      //Asignamos un padding horizontal para que nuestros iconos o texto no estén tan pegados al costado
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        //Creamos un SizeBox que contendrá el interior de nuestro Appbar
        child: SizedBox(
          //Utilizamos un double.infinity que se utiliza para hacer que un widget ocupe todo el ancho disponible en su contenedor padre.
          width: double.infinity,

          //Llamamos a un row para hacer filas en forma horizontal
          child: Row(
            //Aquí debemos colocar las filas
            children: [
              //todo:Colocamos un Icono que será distintitvo como el (Logo) de la app
              Icon(
                  //Icono utilizado
                  Icons.movie_filter_outlined,
                  //Llamamos al color que colocamos en nuestor tema de la aplicación
                  color: colors.primary),

              //Utilizamos un sizebox para un pequeño espacio horizontal
              const SizedBox(width: 5),

              //todo:Colocamos el "Nombre de la aplicación" con un text
              Text(
                  //Nombre
                  'Cinemapedia',
                  //Le agregamos un estilo al texto
                  style: titleStyle),

              //?"Spacer" es un widget que se utiliza para agregar espacio flexible entre otros widgets dentro de un layout.
              //Básicamente, actúa como un resorte que empuja o estira los elementos adyacentes según el espacio disponible en la pantalla.
              const Spacer(),

              //todo:Agregamos un botón de busqueda, que será para filtrar o buscar las películas
              IconButton(
                  //Función del botón
                  onPressed: () {},
                  //Icono del botón
                  icon: const Icon(Icons.search)),

              //todo: Agregamos otro botón que será para cambiar el modo oscuro o light de la aplicación
              IconButton(
                  //Función del botón
                  onPressed: () {},
                  //Icono del botón
                  icon: const Icon(Icons.wb_sunny_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}
