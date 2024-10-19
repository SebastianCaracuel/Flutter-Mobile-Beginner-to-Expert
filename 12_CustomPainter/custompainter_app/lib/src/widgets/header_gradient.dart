//Importaciones Flutter
import 'package:flutter/material.dart';

//?Creamos el Header Diagonal
class HeaderGradient extends StatelessWidget {
  const HeaderGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,

      //todo:Custom Painter
      child: CustomPaint(
        painter: _HeaderGradientPainter(),
      ),
    );
  }
}

//? Creamos una nueva clase, pero extendiendo con el Custom Painter
class _HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //todo: Implementación del Gradient
    const Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ],
        stops: [
          0.3,
          0.5,
          1.0,
        ]);

    //todo:rec / implementacion gradient
    final Rect rect = Rect.fromCircle(
      center: const Offset(165.0, 0.0), //Aquí se cambian los valores
      radius: 180,
    );

    //todo: Implementacion gradient
    final lapiz = Paint()..shader = gradient.createShader(rect);

    //?Propiedades del Lapiz
    //lapiz.color = Colors.red;

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
