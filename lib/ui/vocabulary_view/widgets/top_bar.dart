import 'package:flutter/material.dart';

class CustomToolbarShape extends CustomPainter {
  final Color lineColor;

  const CustomToolbarShape({required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

//First oval
    Path path = Path();
    Rect pathGradientRect = Rect.fromCircle(
      center: Offset(size.width / 4, 0),
      radius: size.width / 1.4,
    );

    Gradient gradient = LinearGradient(
      colors: <Color>[
        const Color.fromRGBO(225, 89, 89, 1).withOpacity(1),
        const Color.fromRGBO(255, 128, 16, 1).withOpacity(1),
      ],
      stops: const [
        0.3,
        1.0,
      ],
    );

    path.lineTo(-size.width / 1.4, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height * 2, size.width + size.width / 1.4, 0);

    paint.color = Colors.deepOrange;
    paint.shader = gradient.createShader(pathGradientRect);
    paint.strokeWidth = 40;
    path.close();

    canvas.drawPath(path, paint);

//Second oval
    Rect secondOvalRect = Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 1.5),
    );

    gradient = LinearGradient(
      colors: <Color>[
        const Color.fromRGBO(225, 255, 255, 1).withOpacity(0.1),
        const Color.fromRGBO(255, 206, 31, 1).withOpacity(0.2),
      ],
      stops: const [
        0.0,
        1.0,
      ],
    );
    Paint secondOvalPaint = Paint()
      ..color = Colors.deepOrange
      ..shader = gradient.createShader(secondOvalRect);

    canvas.drawOval(secondOvalRect, secondOvalPaint);

//Third oval
    Rect thirdOvalRect = Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 2.7),
    );

    gradient = LinearGradient(
      colors: <Color>[
        const Color.fromRGBO(225, 255, 255, 1).withOpacity(0.05),
        const Color.fromRGBO(255, 196, 21, 1).withOpacity(0.2),
      ],
      stops: const [
        0.0,
        1.0,
      ],
    );
    Paint thirdOvalPaint = Paint()
      ..color = Colors.deepOrange
      ..shader = gradient.createShader(thirdOvalRect);

    canvas.drawOval(thirdOvalRect, thirdOvalPaint);

//Fourth oval
    Rect fourthOvalRect = Rect.fromPoints(
      Offset(-size.width / 2.4, -size.width / 1.875),
      Offset(size.width / 1.34, size.height / 1.14),
    );

    gradient = LinearGradient(
      colors: <Color>[
        Colors.red.withOpacity(0.9),
        const Color.fromRGBO(255, 128, 16, 1).withOpacity(0.3),
      ],
      stops: const [
        0.3,
        1.0,
      ],
    );
    Paint fourthOvalPaint = Paint()
      ..color = Colors.deepOrange
      ..shader = gradient.createShader(fourthOvalRect);

    canvas.drawOval(fourthOvalRect, fourthOvalPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CustomAppBar extends SliverPersistentHeaderDelegate {
  final double height;

  const CustomAppBar({required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.transparent,
        child: Stack(fit: StackFit.loose, children: <Widget>[
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: height,
              child: const CustomPaint(
                painter: CustomToolbarShape(lineColor: Colors.deepOrange),
              )),
          Align(
              alignment: const Alignment(0.0, 1.25),
              child: Container(
                  height: MediaQuery.of(context).size.height / 14.5,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20.0,
                            // shadow
                            spreadRadius: .5,
                            // set effect of extending the shadow
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                      ),
                      child: TextField(
                          onSubmitted: (submittedText) {},
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black38,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(25))))))),
          Align(
              alignment: const Alignment(0.9, 0.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 13,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.local_mall,
                      color: Colors.black,
                    ),
                  ))),
          Align(
              alignment: const Alignment(-0.9, 0.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 13,
                  child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      )))),
        ]));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
