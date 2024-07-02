//? Esta será la pantalla que contendrá el formulario de Registro de la nueva sección

//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaciones nuestras
import 'package:forms_app/presentation/Widgets/widgets.dart';

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
      appBar: AppBar(
        title: const Center(child: Text('Create New User')),
        actions: const [Icon(Icons.settings)],
      ),

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
    return SafeArea(
      //Utilizamos un padding para que no este tan pegado el TextFormField del fondo
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //Utilizamos un SingleChiledScroll para que podamos realizar scroll en nuestra pantalla
        //Así poder ver todos nuestros formfield
        child: SingleChildScrollView(
          //Utilizamos una columna para tener más de un widget
          child: Column(
            //Colocamos que este enfocado en el fondo de la aplicación
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Utilizamos un flutter logo de ejemplo

              Image.asset(
                'assets/logo/new_user.png',
                scale: 1.4,
              ),

              //! Aquí va el Diseño del Formulario
              const _RegisterForm(),

              //Espacio
              const SizedBox(height: 20),
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

    //? Utilizamos los colores de nuestra aplicación
    final colors = Theme.of(context).colorScheme;

    //!Widget Hijo
    return Form(
      child: Column(
        children: [
          //Espacio
          const SizedBox(height: 20),

          //todo: TextFormField personalizado Nombre de Usuario
          CustomTextFormField(
              //Personalizamos el Primer Custom Nombre Usuario
              label: 'Name User',
              hint: 'Write your name user',
              icon: Icon(Icons.supervised_user_circle_rounded,
                  color: colors.primary)),

          //Espacio
          const SizedBox(height: 10),

          //todo: TextFormField personalizado Correo Electronico
          CustomTextFormField(
              //Personalizamos el Segundo Custom Correo
              label: 'E-mail address',
              hint: 'Write your Email',
              icon: Icon(Icons.email_rounded, color: colors.primary)),

          //Espacio
          const SizedBox(height: 10),

          //todo: TextFormField personalizado Contraseña
          CustomTextFormField(
              //Personalizamos el Tercer Custom Contraseña
              label: 'Password',
              hint: 'Write your Password',
              obscureText: true,
              icon: Icon(Icons.password_rounded, color: colors.primary)),

          //Espacio
          const SizedBox(height: 20),

          //Botón
          FilledButton.tonalIcon(
              onPressed: () {},
              icon: Icon(
                Icons.save,
                color: colors.primary,
              ),
              label: const Text('Create new user')),
        ],
      ),
    );
  }
}
