//!TODO GETTERS AND SETTERS


void main (){
  
  
  final mySquare = Square (side : -10);
  //final mySquare = Square (side : -10);//Le restamos al numero
  
  
  
  //mySquare.side = 5; 
  
  //mySquare.side = -5; //Imprimimos un error de que el valor debe ser mayor a 0
  
  //Imprimimos el area
  print ( 'area : ${mySquare.area }' );
}


//Creamos una Clase
class Square{
  
  double _side; //Side * side
  
  Square ({ required  double side })
    
    //!TODO ASERSIONES
    
    : assert(side >= 0, 'Side must be >= 0'),
    _side = side;
  
  
  double get area{
    return _side * _side;
  }
  
  set side(double value){
    print('Setting new value $value');
    
    //Si el numero es menor a 0 entonces manda el mensaje
    if (value < 0) throw 'Value must be >= 0';//El valor debe ser mayor o igual a 0
    
    _side = value;
  }
  
  
  double calculateArea(){
    return _side * _side;
  }
}