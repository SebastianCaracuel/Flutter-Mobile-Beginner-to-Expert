void main () {
  
  
  // ? MAPS
  // ? Es un Objeto que asocia pares de valores, las llaves y
  // ? valores pueden ser de cualquier tipo de dato.
  
  //! Esta es una forma de realizar el MAPA
  //! Esta forma es la más recomendada
  final pokemon1 = {
    
    'Nombre' : 'Ditto',
    'vida' : 50,
    
  };
  
  //! Esta es otra forma de realizar el MAPA 
  //Común de utilzar pero no tan eficiente
  final Map<String, dynamic> pokemon = {
    'Nombre' : 'Charmander',
    'vida' : 100,
    'estaVivo?': true,
    'tipoPokemon' : <String>['volador', 'Fuego'],
    'imagen' : {
      1: 'charmander/front.png',
      2: 'charmander/back.png',
    },
  };
  
  
  print(pokemon1);
  print('');  
  print(pokemon);
  print('');  
  
  
  //!TODO: Para ver correctamente el MAPA
    
  print('Nombre : ${pokemon['Nombre']}');
  print('¿Cuanta vida tiene?: ${pokemon['vida']}');
  print('¿Esta vivo?: ${pokemon['estaVivo?']}');
  print('¿Cual es el Tipo de Pokemon? : ${pokemon['tipoPokemon']}');
  
  //!TODO: Para ver las imagenes
  print('Back : ${ pokemon['imagen'][2]   }');
  print('Front : ${ pokemon['imagen'][1] }');
  
}
