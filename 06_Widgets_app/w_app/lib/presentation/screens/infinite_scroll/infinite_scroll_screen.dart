import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Creamos nuestra Screen
class InfiniteScrollScreen extends StatefulWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'infinite_screen';

  //Constructor
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

//State
class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  //Propiedades

  //Definimos una lista para las imagenes - para ver el itemcount
  List<int> imagesIds = [1, 2, 3, 4, 5];

  //creamos un controlador del scroll
  final ScrollController scrollController = ScrollController();

  //Creamos una bandera para que no se dispare muchs veces el cargador
  bool isLoading = false;

  //Creamos otra bandera
  bool isMounted = true;

  //Iniciamos el ciclo de vida de este controller
  @override
  void initState() {
    super.initState();

    //
    scrollController.addListener(() {
      //Quiero cargar más imagenes cuando llego al final - //?Pero como determino que estoy al final
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
    });
  }

//Cerramos el ciclo de vida del controller
  @override
  void dispose() {
    //Llamamos al scrollcontroller para limpiarlo.
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  //Creamos el metodo para el loading
  Future loadNextPage() async {
    //Cuando llamamos a nuestra bandera de loading preguntamos

    //?Si el loading esta en true no haré nada y que se salga de la petición
    if (isLoading) return true;
    //SI no esta cargando que muestre el loading en true
    isLoading = true;

    //Llamamos el set para redibujar
    setState(() {});

    //realizamos una espera con await de dos segundos
    await Future.delayed(const Duration(seconds: 2));

    //Llamamos a nuestro metodo de 5 imagenes
    addFiveImages();

    //Colocamos el loading en false
    isLoading = false;

    //todo: Revisar si está montado el componente /widget
    //llamamos nuevamente al set estate para re dibujar
    if (!isMounted) return;
    setState(() {});

    //todo: mover scroll
    //Llamamos al scroll button
    moveScrollToBottom();
  }

  //Creamos un nuevo metodo que nos ayudará a implementar el refresh
  Future<void> onRefresh() async {
    //esta cargando
    isLoading = true;

    //ciclo
    setState(() {});

    //Le colocamos un delay de 3 segundo para esperar
    await Future.delayed(const Duration(seconds: 1));

    //verificamos ( Si no esta montado estonces no haré nada)
    if (!isMounted) return;

    //esta cargando
    isLoading = false;

    //Regresamos el procedimiento de la lista de las imagenes
    final lastId = imagesIds.last;

    //Llamamos a las imagenes y las borro completamente
    imagesIds.clear();

    //Añadimos una imagen despues de la ultima imagen
    imagesIds.add(lastId + 1);
    //luego añadimos las 5 nuevas imagenes
    addFiveImages();

    //ciclo
    setState(() {});
  }

  //Creamos un metodo para  cargar otras imagens
  void addFiveImages() {
    //creamos una propiedad para sacar el ultimo valor  de nuestra lista
    final lastId = imagesIds.last;

    //Quiero insertar 5 elementos más
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  //Creamos un metodo para mover scroll de forma automatica
  void moveScrollToBottom() {
    //creamos una condición

    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    //
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Agregamos un color oscuro al fondo
      backgroundColor: Colors.black,

      //Colocamos un media query para quitar los espacios del top y el button
      body: MediaQuery.removePadding(
        //
        context: context,
        //Quitamos el espacio de la parte superior
        removeTop: true,
        //Quitamos el espacio de la parte inferior
        removeBottom: true,
        //Llamamos a un widget RefreshIndicator para realizar un refresh
        child: RefreshIndicator(
          //El onRefresh es lo que voy a llamar cuando se esta realizando el trabajo
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,

          //Llamamos a un listview
          child: ListView.builder(
            //Asignamos un ItemCount
            itemCount: imagesIds.length,
            //Llamamos a nuestro controlador
            controller: scrollController,
            //Utilizamos un itembuilder
            itemBuilder: (context, index) {
              //todo: FadeInImage
              //?Mientras la imagen objetivo se está cargando, se muestra una imagen de marcador de posición,
              //? y cuando la imagen se carga, se desvanece suavemente para revelar la imagen final.
              return FadeInImage(
                //Le colocamos BoxFit para que ocupe todo el espacio asignado y no haya nada en blanco
                fit: BoxFit.cover,
                //Definimos el ancho de la imagen
                width: double.infinity,
                //Definimos la altura de la imagen
                height: 300,
                //Imagen de carga
                placeholder: const AssetImage('assets/images/loading.gif'),
                //Imagenes que mostraremos
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),

      //Creamos un botón para salir de esta screen
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(
                duration: const Duration(seconds: 1),
                child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}
