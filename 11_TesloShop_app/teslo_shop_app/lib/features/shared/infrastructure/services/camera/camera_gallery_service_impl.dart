//?Esta es la implementación o el código necesario para que funcione

//Importaciones Flutter
import 'package:image_picker/image_picker.dart';

//Importaciones Nuestras
import 'camera_gallery_service.dart';

class CameraGalleryServiceImpl extends CameraGalleryService {
  //Llamamos a la referencia del Paquete
  final ImagePicker _picker = ImagePicker();

  //todo: Tomar una Foto
  @override
  Future<String?> takePhoto() async {
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);

    if (photo == null) return null;

    print('Tenemos una imagen ${photo.path}');

    return photo.path;
  }

  //todo: Seleccionar una foto
  @override
  Future<String?> selectPhoto() async {
    final ImagePicker _picker = ImagePicker();

    // Capture a photo.
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      //Le decimos que queremos el 80% de la calidad de la imagen, pero también puede ser el 100
      imageQuality: 80,
    );

    //Preguntamos
    if (photo == null) return null;

    print('Tenemos una imagen ${photo.path}');

    return photo.path;
  }

  //todo: Seleccionar multiples Fotos

  @override
  Future<List<String?>> selectMultiplePhotos() {
    //: implement selectMultiplePhotos
    throw UnimplementedError();
  }
}
