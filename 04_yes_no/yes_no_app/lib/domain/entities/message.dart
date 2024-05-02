//Creamos una enumeración para tener un control
enum FromWho { me, miles }

//Creamos una entidad
class Message {
  //Texto
  final String text;
  //El meme o gif que me mandará la persona
  final String? imageUrl;
  //
  final FromWho fromWho;

  Message({required this.text, required this.fromWho, this.imageUrl});
}
