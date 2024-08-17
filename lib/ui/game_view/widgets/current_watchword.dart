import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWatchword extends StatelessWidget {
  final String currentWord;
  const CurrentWatchword({Key? key, required this.currentWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0),
              child: Card(
                color: Color.fromARGB(255, 226, 226, 226),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(currentWord,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: GoogleFonts.poppins(
                            shadows: [
                              const Shadow(
                                color: Color.fromARGB(255, 170, 170, 170),
                                blurRadius: 3.0,
                                offset: Offset(1.5, 1.5),
                              ),
                            ],
                            color: const Color(0xFF252525),
                            fontSize: MediaQuery.of(context).size.height < 600
                                ? 20
                                : 26,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
