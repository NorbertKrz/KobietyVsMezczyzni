import 'package:animated_background/animated_background.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gender_fight/routes/app_router.dart';
import 'dart:async';
import 'dart:math';

import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class RandomSelectionScreen extends StatefulWidget {
  const RandomSelectionScreen({super.key});

  @override
  State<RandomSelectionScreen> createState() => _RandomSelectionScreenState();
}

class _RandomSelectionScreenState extends State<RandomSelectionScreen>
    with TickerProviderStateMixin {
  String _displayText = 'Trwa losowanie';
  late bool _isManTurn;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startRandomSelection();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startRandomSelection() {
    int counter = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _displayText =
            "Trwa losowanie\n ${(counter % 2 == 0) ? 'Mężczyźni' : 'Kobiety'}";
        counter++;
      });
      if (counter == 30) {
        timer.cancel();
        _finalizeSelection();
      }
    });
  }

  void _finalizeSelection() {
    setState(() {
      _isManTurn = Random().nextBool();
      _displayText = 'Grę rozpoczną:\n${_isManTurn ? 'Mężczyźni' : 'Kobiety'}';
    });

    Timer(const Duration(seconds: 3), () {
      context.router.removeLast();
      AutoRouter.of(context).push(GameRoute(
        isMenTurn: _isManTurn,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainViewGradient.first,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: mainViewGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp),
          ),
          width: double.maxFinite,
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                spawnMaxRadius: 10,
                spawnMinSpeed: 5,
                particleCount: 18,
                spawnMaxSpeed: 15,
                minOpacity: 0.1,
                opacityChangeRate: 0.5,
                spawnOpacity: 0.4,
                baseColor: Color.fromARGB(69, 255, 255, 255),
              ),
            ),
            vsync: this,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        child: AnimatedSwitcher(
                            duration: const Duration(seconds: 2),
                            child: _timer.isActive
                                ? Image.asset(
                                    key: UniqueKey(),
                                    'assets/images/unknownLogo.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    fit: BoxFit.contain,
                                  )
                                : _isManTurn
                                    ? Image.asset(
                                        key: UniqueKey(),
                                        'assets/images/menLogo.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        fit: BoxFit.contain,
                                      )
                                    : Image.asset(
                                        key: UniqueKey(),
                                        'assets/images/womenLogo.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        fit: BoxFit.contain,
                                      )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _timer.isActive
                                ? Text(
                                    _displayText,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        shadows: [
                                          const Shadow(
                                            color: Colors.black,
                                            blurRadius: 2.0,
                                            offset: Offset(2.0, 2.0),
                                          ),
                                        ],
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900),
                                  )
                                : TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 7, end: 35),
                                    duration: const Duration(seconds: 2),
                                    builder: (context, value, child) {
                                      return Text(
                                        _displayText,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            shadows: [
                                              const Shadow(
                                                color: Colors.black,
                                                blurRadius: 2.0,
                                                offset: Offset(2.0, 2.0),
                                              ),
                                            ],
                                            color: Colors.white,
                                            fontSize: value,
                                            fontWeight: FontWeight.w900),
                                      );
                                    },
                                  ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
