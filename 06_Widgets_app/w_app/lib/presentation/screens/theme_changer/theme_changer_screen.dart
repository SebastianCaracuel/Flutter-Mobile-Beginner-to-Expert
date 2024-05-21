//Importaciones
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:w_app/presentation/providers/theme_provider.dart';

//Clase
class ThemeChangeScreen extends ConsumerWidget {
  //Propiedades
  static const String name = 'ThemeChanger_screen';

  //Constructor
  const ThemeChangeScreen({super.key});

//Objeto
  @override
  Widget build(BuildContext context, ref) {
    //Propiedades del objeto
    final isDarkMode = ref.watch(isDarkModeProvider); //Referencia del DarkMode

    return Scaffold(
      //MenuSuperior
      appBar: AppBar(
        //titulo
        title: const Text('Theme Change'),
        actions: [
          IconButton(
            //Iconos switch
            icon: Icon(isDarkMode
                ? Icons.light_mode_rounded
                : Icons.dark_mode_rounded),

            //Función
            onPressed: () {
              ref
                  .read(isDarkModeProvider.notifier)
                  .update((isDarkMode) => !isDarkMode);
            },
          ),
        ],
      ),

      //Cuerpo
      body: const _ThemeChangerView(), //?Extragimos el Widget
    );
  }
}

//?Widget extraido
class _ThemeChangerView extends ConsumerWidget {
  //Propiedades de la clase

  //Constructor
  const _ThemeChangerView();

//Objeto
  @override
  Widget build(BuildContext context, ref) {
    //Propiedades del Objeto
    final List<Color> colors = ref.watch(colorListProvider);
    final int isSelectedColor = ref.watch(selectedColorProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return ListView.builder(
      //Listado de colores con el lenght
      itemCount: colors.length,
      //Builder
      itemBuilder: (context, index) {
        //Propiedad del builder
        final Color color = colors[index];

        return RadioListTile(
          //Colocamos un titulo
          title: Text('Este color es : ', style: TextStyle(color: color)),
          //Colocamos un Subtitle
          subtitle: Text('${color.value}'),
          //Queremos que al seleccionar el circulito también sea del color que estamos presionando
          activeColor: color,
          //Valor del radio
          value: index,
          //Grupo del valor
          groupValue:
              isSelectedColor, //Este es el valor seleccionado (flutter sabe cual es el valor que tenemos mediante este groupvalue)
          //Cuando cambia
          onChanged: (value) {
            //todo: Notificar el cambio

            //Llamamos a nuestra referencia, lo leímos y lo notificamos porque queremos que se actualice.
            //Llamamos al state y le mandamos el Index para saber donde estamos parados
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
