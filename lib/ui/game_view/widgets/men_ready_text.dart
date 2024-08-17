import 'package:flutter/material.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MenReadyText extends StatelessWidget {
  const MenReadyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Mężczyźni',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: MediaQuery.of(context).size.height < 600 ? 45 : 60,
                fontWeight: FontWeight.w900),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'gotowi?',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                color: kMenButton,
                fontSize: MediaQuery.of(context).size.height < 600 ? 45 : 60,
                fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
