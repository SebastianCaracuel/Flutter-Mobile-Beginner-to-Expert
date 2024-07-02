//? Esta será la pantalla que contendrá el formulario de Registro de la nueva sección

//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaciones nuestras

//Creamos la nueva pantalla
class RegisterScreen extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const RegisterScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //!Widget Padre
    return Scaffold(
      //? Colocamos un titulo, y un Appbar
      appBar: AppBar(title: const Center(child: Text('New User'))),

      //todo: Extraimos el Widget
      body: const _RegisterView(),
    );
  }
}

//Extraxión del Widget Hijo - Body
class _RegisterView extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const _RegisterView();

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades

    //Widget Hijo
    return const SafeArea(
      //Utilizamos un padding para que no este tan pegado el TextFormField del fondo
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //Utilizamos un SingleChiledScroll para que podamos realizar scroll en nuestra pantalla
        //Así poder ver todos nuestros formfield
        child: SingleChildScrollView(
          //Utilizamos una columna para tener más de un widget
          child: Column(
            //Colocamos que este enfocado en el fondo de la aplicación
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Utilizamos un flutter logo de ejemplo
              FlutterLogo(size: 250),

              //! Aquí va el Diseño del Formulario
              _RegisterForm(),

              //Espacio
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

//? Creamos un Widget que será exportado, esto es un Widget de Diseño, para el campo de texto (TextFormField)
//Creamos la clase
class _RegisterForm extends StatelessWidget {
  //Propiedad de la calse

  //Constructor
  const _RegisterForm();

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedad del Objeto

    //!Widget Hijo
    return Form(
      child: Column(
        children: [
          //TextFormField
          TextFormField(),

          //Espacio
          const SizedBox(height: 20),

          //Botón
          FilledButton.tonalIcon(
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text('Create new user')),
        ],
      ),
    );
  }
}
