//Importaciones Flutter
import 'package:flutter/material.dart';

//?Creamos el Header Diagonal
class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,

      //todo:Custom Painter
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

//? Creamos una nueva clase, pero extendiendo con el Custom Painter
class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Creamos una variable "El lapiz para pintar
    final lapiz = Paint();

    //?Propiedades del Lapiz
    lapiz.color = const Color(0xff5AA5CD);

    //?¿Que tipo de rellenado quiero?
    // lapiz.style = PaintingStyle.stroke; //Son solo los bordes
    lapiz.style = PaintingStyle.fill; //Rellena todo

    //?¿Que tan ancho quiero que sea ese lapiz?
    lapiz.strokeWidth = 20;

    //?¿Como queremos mover el lapiz?
    final path = Path();

    //todo: Con esto Dibujamos
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    //?Le decimos al canvas que dibuje el Path, usando el lapiz
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
