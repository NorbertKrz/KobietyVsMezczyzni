import 'package:flutter/material.dart';

class BackgroundCircles extends StatefulWidget {
  const BackgroundCircles({Key? key}) : super(key: key);

  @override
  State<BackgroundCircles> createState() => _BackgroundCirclesState();
}

class _BackgroundCirclesState extends State<BackgroundCircles>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65.0),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.width),
            painter:
                MyCirclePainter(const Color.fromARGB(50, 255, 255, 255), 0.65),
          ),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.width),
            painter:
                MyCirclePainter(const Color.fromARGB(54, 255, 255, 255), 0.55),
          ),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.width),
            painter:
                MyCirclePainter(const Color.fromARGB(69, 255, 255, 255), 0.45),
          ),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.width),
            painter:
                MyCirclePainter(const Color.fromARGB(69, 255, 255, 255), 0.35),
          ),
        ],
      ),
    );
  }
}

class MyCirclePainter extends CustomPainter {
  final Color color;
  final double sizeUser;

  MyCirclePainter(this.color, this.sizeUser);

  @override
  void paint(Canvas canvas, Size size) {
    final double circleRadius = size.width * sizeUser;
    final Offset circleCenter = Offset(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(circleCenter, circleRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
