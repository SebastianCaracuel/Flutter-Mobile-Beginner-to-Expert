

//!Clases Abstractas


void main (){
  
  final windPlant = WindPlant(initialEnergy: 100);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);
  
  print ('wind: ${chargePhone( windPlant ) }');
  print ('nuclear: ${chargePhone( nuclearPlant ) }');
  

}

//Creamos una funcion
double chargePhone(EnergyPlant plant){
  //
  if(plant.energyLeft <10){
    throw Exception('No hay suficiente energia');
  } 
  return plant.energyLeft -10;
}


//Creamos una enumeracion
enum PlanType { nuclear, wind, water }

//Creamos una clase abstract
abstract class EnergyPlant{

  double energyLeft;//Energia restante
 
  final PlanType type; //Tipo de plata | nuclear, wind, water
  
  EnergyPlant({
     required this.energyLeft,
    required this.type,
  });
  
  //Creamos un metodo
  
  void consumeEnergy(double amount);
  
  
}




//! EXTENDS 

//Creamos una nueva clase
//Planta de energía heolica
class WindPlant extends EnergyPlant{ 
  
  //
  WindPlant({required double initialEnergy})
      : super(energyLeft: initialEnergy,type: PlanType.wind);
  
  @override
  void consumeEnergy(double amount ){
    energyLeft -= amount;
  }
  
}


//! IMPLEMENTS

//Creamos una nueva clase
class NuclearPlant implements EnergyPlant{
  
  @override
  double energyLeft;
  
  @override
  final PlanType type = PlanType.nuclear;
  
  NuclearPlant({required this.energyLeft});
  
  @override
  void consumeEnergy(double amount ){
    energyLeft -= (amount * 0.5);
  }
  
}



