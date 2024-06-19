
//!TODO: CONSTRUCTORES CON NOMBRES
//? Posibilidad de tener múltiples constructores en nuestra clase

void main() {
  
  
  final Map<String, dynamic> rawJson = {
    'name': 'flash',
    'power': 'velocidad',
    'estavivo': true
    
  };
  
  //final ironman = Hero(
  //estavivo: false,
  //power: 'Money',
  //name: 'Tony Stark'
  //);
  
  final ironman = Hero.fromJson( rawJson );
  
  print (ironman);
  
  
}


class Hero{
  String name;
  String power;
  bool estavivo;
  
  
  Hero({
   required this.name,
  required this.power,
  required this.estavivo
  });
  
  Hero.fromJson( Map<String, dynamic>json )
    : name = json['name'] ?? 'Nombre no encontrado',
     power = json['power'] ?? 'Poder no encontrado',
     estavivo = json['estavivo'] ?? ' No encontrado';
  
  
  
  @override
  String toString(){
    return '$name, $power,  Esta vivo : ${estavivo ? 'yes!': 'nop'}';
  }
  
  
}
