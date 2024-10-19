//Importaciones Flutter
import 'package:flutter/material.dart';

//?Creamos el Header Diagonal
class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,

      //todo:Custom Painter
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      ),
    );
  }
}

//? Creamos una nueva clase, pero extendiendo con el Custom Painter
class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Creamos una variable "El lapiz para pintar
    final lapiz = Paint();

    //?Propiedades del Lapiz
    lapiz.color = const Color(0xff27E6EC);

    //?¿Que tipo de rellenado quiero?
    //lapiz.style = PaintingStyle.stroke; //Son solo los bordes
    lapiz.style = PaintingStyle.fill; //Rellena todo

    //?¿Que tan ancho quiero que sea ese lapiz?
    lapiz.strokeWidth = 2;

    //?¿Como queremos mover el lapiz?
    final path = Path();

    //todo: Con esto Dibujamos un triangulo Pintando la parte de arriba
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0, 0);

    //todo:Con esto Dibujamos un triangulo Pintando la parte de abajo
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // path.lineTo(0, 0);

    //?Le decimos al canvas que dibuje el Path, usando el lapiz
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
