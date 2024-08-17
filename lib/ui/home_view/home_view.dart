import 'package:animated_background/animated_background.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gender_fight/routes/app_router.dart';
import 'package:gender_fight/ui/global/buttons/animated_elevated_button.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:gender_fight/ui/global/variables.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final AudioPlayer _audioPlayerButtons = AudioPlayer();
  String click = "audios/click.mp3";

  @override
  void dispose() {
    _audioPlayerButtons.dispose();
    super.dispose();
  }

  Future<void> _playSound(String path) async {
    await _audioPlayerButtons.play(AssetSource(path));
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
                child: Column(children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Image.asset(
                              'assets/images/womenVsMenLogo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: AnimatedButton(
                              width: 230,
                              height: 75,
                              onPressed: () {
                                _playSound(click).then((value) {
                                  AutoRouter.of(context)
                                      .push(const RandomSelectionRoute());
                                });
                              },
                              color: kPastelBlueDDarker,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Nowa gra',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: AnimatedButton(
                              width: 200,
                              height: 75,
                              onPressed: () {
                                _playSound(click).then((value) {
                                  _dialogGameRules(context);
                                  // AutoRouter.of(context)
                                  //     .push(const HowPlayRoute());
                                });
                              },
                              color: kPastelOrangeDarker,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Jak grać',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: AnimatedButton(
                        //     width: 170,
                        //     height: 75,
                        //     onPressed: () {
                        //       _playSound(click);
                        //       AutoRouter.of(context)
                        //           .push(const VocabularyRoute());
                        //     },
                        //     color: kPastelBlueDarker,
                        //     child: Text(
                        //       'Słownictwo',
                        //       style: GoogleFonts.poppins(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 18),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Wersja: $currentVersion',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              )),
        ));
  }

  Future<void> _dialogGameRules(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Color.fromARGB(255, 216, 216, 216),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Zasady gry',
            style: GoogleFonts.poppins(
                color: kTextColor, fontWeight: FontWeight.w700, fontSize: 17),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '1. Podzielcie się na 2 drużyny (damską oraz męską).',
                  style: GoogleFonts.poppins(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '2. Wybierzcie nową grę. Rozgrywkę rozpocznie wylosowana drużyna.',
                  style: GoogleFonts.poppins(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '3. Wybierzcie osobę z drużyny, która rozpocznie jako pierwsza (jeżeli brak ochotnika - rozpoczyna najmłodsza osoba z drużyny).',
                  style: GoogleFonts.poppins(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '4. Opisz swojej drużynie w dowolny sposób wyświetlane hasło.',
                  style: GoogleFonts.poppins(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  'assets/images/haslo.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '5. Jeżeli prawidłowo odgadniecie dane hasło, kliknij "Dobrze", aby przejść do następnego. Jeżeli nie masz pomysłu lub nie widzisz już nadziei przy którymś z haseł, możesz je pominąć (pamiętaj jednak, że za każde pominięcie jest ujemny punkt)',
                  style: GoogleFonts.poppins(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  'assets/images/punkty.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '6. Po upływie czasu przekaż telefon drużynie przeciwnej (zgodnie z kierunkiem ruchu zegara).',
                  style: GoogleFonts.poppins(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: AnimatedButton(
              height: 60,
              width: 80,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              color: kLightGreen,
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0XFFFFFFFF),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
