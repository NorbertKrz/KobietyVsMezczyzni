import 'package:flutter/material.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:gender_fight/ui/global/styles/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  final int menScore;
  final int womenScore;
  final bool isMenTurn;
  const TopBar(
      {Key? key,
      required this.isMenTurn,
      required this.menScore,
      required this.womenScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            color: const Color.fromARGB(141, 190, 190, 190),
            surfaceTintColor: const Color.fromARGB(255, 185, 185, 185),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('Kobiety', style: playStyleBold13)),
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(womenScore.toString(),
                                  style: playStyleBold34)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child:
                                  Text("Teraz grają:", style: playStyleBold20)),
                        ),
                        isMenTurn
                            ? FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Mężczyźni',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      shadows: [shadowStyleBigBlur],
                                      color: kMenButton,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              )
                            : FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Kobiety',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black,
                                          blurRadius: 2.0,
                                          offset: Offset(1.5, 1.5),
                                        ),
                                      ],
                                      color: kWomenButton,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('Mężczyźni', style: playStyleBold13)),
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(menScore.toString(),
                                  style: playStyleBold34)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
