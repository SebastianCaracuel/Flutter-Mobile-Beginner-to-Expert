
//!Todo Mixins


abstract class Animal {}

//Creamos las clases abstractas
abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}


//Creamos los mixin 
mixin Volador {
  void volar() => print('estoy volando!');
}

mixin Caminante {
  void caminar() => print('estoy caminando!');
}

mixin Nadador {
  void nadar() => print('estoy nadando!');
}


//Creamos las clases de los animales
class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with Volador, Caminante {}
class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}
class Pato extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}
class PezVolador extends Pez with Nadador, Volador {}


//Instanciamos
void main() {
  final flipper = Delfin();
  flipper.nadar();

  final batman = Murcielago();
  batman.caminar();
  batman.volar();

  final namor = Pato();
  namor.caminar();
  namor.volar();
  namor.nadar();
}
