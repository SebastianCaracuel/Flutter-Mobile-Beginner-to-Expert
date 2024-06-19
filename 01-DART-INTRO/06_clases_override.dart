
//!TODO: CLASES

void main() {
  //Forma Normal
  //final spiderMan = new Hero('Peter Parker', 'Sentido Aracnido');
  
  //Forma con los argumentos por nombre
  final spiderMan = new Hero(name: 'Peter Parker', power: 'Sentido Aracnido');
  
  print(spiderMan);
  print(spiderMan.name);
  print(spiderMan.power);
}


class Hero{
  
  String name;
  String power;

  //? Esta es una Forma de hacerlo
  //Hero( String pName, String pPower )
    //: name = pName,
      //power = pPower;
  
  
  //? Esta es otra Forma de realizarlo
  //Hero(this.name, this.power);
  
  //!TODO: ¿Pero que pasaría si quiero poner los argumentos por nombre?
  //!TODO: y que sea obligatorio
  Hero({ required this.name, 
        
        //? Y si no tiene poder, pero no quiero que sea obligatorio?
        //required this.power });
        this.power = 'NO TIENE PODERES' });
  
  @override
  String toString(){
    return 'Heroes';
  }
}


