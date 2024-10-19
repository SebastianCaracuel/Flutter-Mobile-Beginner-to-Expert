//Importaciones Flutter
import 'package:flutter/material.dart';

//?Creamos el Header Diagonal
class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,

      //todo:Custom Painter
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

//? Creamos una nueva clase, pero extendiendo con el Custom Painter
class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Creamos una variable "El lapiz para pintar
    final lapiz = Paint();

    //?Propiedades del Lapiz
    lapiz.color = const Color(0xff18A3B7);

    //?¿Que tipo de rellenado quiero?
    //lapiz.style = PaintingStyle.stroke; //Son solo los bordes
    lapiz.style = PaintingStyle.fill; //Rellena todo

    //?¿Que tan ancho quiero que sea ese lapiz?
    lapiz.strokeWidth = 2;

    //?¿Como queremos mover el lapiz?
    final path = Path();

    //Dibujar con el path y con el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.28);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //?Le decimos al canvas que dibuje el Path, usando el lapiz
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
