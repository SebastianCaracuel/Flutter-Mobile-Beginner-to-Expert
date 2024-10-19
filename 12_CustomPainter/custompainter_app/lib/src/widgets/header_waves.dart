//Importaciones Flutter
import 'package:flutter/material.dart';

//?Creamos el Header Diagonal
class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,

      //todo:Custom Painter
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

//? Creamos una nueva clase, pero extendiendo con el Custom Painter
class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Creamos una variable "El lapiz para pintar
    final lapiz = Paint();

    //?Propiedades del Lapiz
    lapiz.color = const Color(0xff615AAB);

    //?¿Que tipo de rellenado quiero?
    // lapiz.style = PaintingStyle.stroke; //Son solo los bordes
    lapiz.style = PaintingStyle.fill; //Rellena todo

    //?¿Que tan ancho quiero que sea ese lapiz?
    lapiz.strokeWidth = 20;

    //?¿Como queremos mover el lapiz?
    final path = Path();

    //todo: creado por mi
    // path.lineTo(0, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.2, size.height * 0.4,
    //     size.width * 0.5, size.height * 0.25);

    // path.quadraticBezierTo(
    //     size.width * 0.7, size.height * 0.10, size.width, size.height * 0.30);
    // path.lineTo(size.width, 0);

    //todo: Creado por fernando
    path.lineTo(0, size.height * 0.25);
    //?Hacia abajo
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    //?Hacia arriba
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    //todo: Dejamos el Wave / Ola debajo
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.70,
    //     size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(
    //     size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    //?Le decimos al canvas que dibuje el Path, usando el lapiz
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
