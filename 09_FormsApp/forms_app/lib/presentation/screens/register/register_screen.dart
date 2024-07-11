//? Esta será la pantalla que contendrá el formulario de Registro de la nueva sección

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Importaciones nuestras
import 'package:forms_app/presentation/Widgets/widgets.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

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
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView(),
        ));
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
class _RegisterForm extends StatefulWidget {
  //Propiedad de la calse

  //Constructor
  const _RegisterForm();

  //State
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

//Clase State - //? Transformamos el _registerForm en un StatefulWidget
class _RegisterFormState extends State<_RegisterForm> {
  //Propiedades State

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedad del Objeto

    //? Llamamos la referencia a nuestro Cubit, para conectar cubit al Formulario
    final registerCubit = context.watch<RegisterCubit>();

    //? Utilizamos los colores de nuestra aplicación
    final colors = Theme.of(context).colorScheme;

    //!Widget Hijo
    return Form(
      //Añadimos nuestra clave global para manejar el estado del Formulario
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
                color: colors.primary),
            //conectamos el valor que escriba el usuario con la variable de nombre de usuario
            onChanged: (value) {
              //Cada vez que una persona realicé un cambio, se valida cada uno de los cambios
              registerCubit.usernameChanged(value);
            },
            // ? Validaciones correspondientes al campo
            validator: (value) {
              //Creamos una validación de que el valor no tiene que ir vacio
              if (value == null || value.isEmpty) return 'Campo Requerido';
              if (value.trim().isEmpty) return 'Campo Requerido';
              if (value.trim().length < 6) {
                return 'El Usuario debe tener más de 6 Letras';
              }
              return null;
            },
          ),

          //Espacio
          const SizedBox(height: 10),

          //todo: TextFormField personalizado Correo Electronico
          CustomTextFormField(
            //Personalizamos el Segundo Custom Correo
            label: 'E-mail address',
            hint: 'Write your Email',
            icon: Icon(Icons.email_rounded, color: colors.primary),
            //conectamos el valor que escriba el usuario con la variable de Email
            onChanged: (value) {
              //Cada vez que una persona realicé un cambio, se valida cada uno de los cambios
              registerCubit.emailChanged(value);
            },
            // ? Validaciones correspondientes al campo
            validator: (value) {
              //Creamos una validación de que el valor no tiene que ir vacio
              if (value == null || value.isEmpty) return 'Campo Requerido';
              if (value.trim().isEmpty) return 'Campo Requerido';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              //
              if (!emailRegExp.hasMatch(value)) {
                return 'Formato de Correo incorrecto.';
              }
              return null;
            },
          ),

          //Espacio
          const SizedBox(height: 10),

          //todo: TextFormField personalizado Contraseña
          CustomTextFormField(
            //Personalizamos el Tercer Custom Contraseña
            label: 'Password',
            hint: 'Write your Password',
            obscureText: true,
            icon: Icon(Icons.password_rounded, color: colors.primary),
            //conectamos el valor que escriba el usuario con la variable de contraseña
            onChanged: (value) {
              //Cada vez que una persona realicé un cambio, se valida cada uno de los cambios
              registerCubit.passwordChanged(value);
            },
            // ? Validaciones correspondientes al campo
            validator: (value) {
              //Creamos una validación de que el valor no tiene que ir vacio
              if (value == null || value.isEmpty) return 'Campo Requerido';
              if (value.trim().isEmpty) return 'Campo Requerido';
              if (value.trim().length < 6) {
                return 'La Contraseña debe tener más de 6 Letras';
              }
              return null;
            },
          ),

          //Espacio
          const SizedBox(height: 20),

          //Botón
          FilledButton.tonalIcon(
              //! Función para ver los datos
              onPressed: () {
                //Llamamos al método
                registerCubit.onSubmit();
              },
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
