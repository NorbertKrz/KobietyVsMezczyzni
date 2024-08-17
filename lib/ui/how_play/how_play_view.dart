import 'package:animated_background/animated_background.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:gender_fight/ui/how_play/animation_logo_bar.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class HowPlayScreen extends StatefulWidget {
  const HowPlayScreen({Key? key}) : super(key: key);

  @override
  State<HowPlayScreen> createState() => _HowPlayScreenState();
}

class _HowPlayScreenState extends State<HowPlayScreen>
    with TickerProviderStateMixin {
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
              child: Stack(
                children: [
                  // const BackgroundCircles(),
                  AnimatedBackground(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 300,
                            child: SliverPersistentHeader(
                              delegate: AnimationLogoBar(),
                              pinned: true,
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     const SizedBox(
                          //       height: 50,
                          //     ),
                          //     Image.asset(
                          //       'assets/images/womenVsMenLogo.png',
                          //       width: 250,
                          //       fit: BoxFit.contain,
                          //     ),
                          //     const SizedBox(
                          //       height: 10,
                          //     ),
                          //   ],
                          // ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '1. Podzielcie się na 2 drużyny (damską oraz męską).',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '2. Kliknijcie "Nowa gra", aby rozpocząć zabawę.',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '3. Rozpocznie się losowanie, która drużyna rozpoczyna jako pierwsza.',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '4. Wybierzcie osobę, która rozpocznie jako pierwsza (jeżeli brak ochotnika - rozpoczyna najmłodsza osoba z drużyny).',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '5. Próbuj przedstawić swojej drużynie wyświetlane hasło, tak aby mogła je odgadnąć.',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '6. Jeżeli hasło zostanie odgadnięte, kliknij "Dobrze", aby przejść do następnego. Jeżeli nie masz pomysłu lub nie widzisz już nadziei przy którymś z haseł, możesz je pominąć (pamiętaj jednak, że za każde pominięcie jest ujemny punkt).',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '7. Po upływie czasu przekaż telefon drużynie przeciwnej (zgodnie z kierunkiem ruchu zegara).',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '8. Brakuje Wam nowych haseł? Przejdź do zakładki "Słownictwo" w widoku głównym, wybierz interesujący Cię pakiet słów i bawcie się dalej.',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              )),
        ));
  }
}
