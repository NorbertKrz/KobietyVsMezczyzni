import 'package:flutter/material.dart';
import 'package:gender_fight/ui/global/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle playStyleBold13 = GoogleFonts.poppins(
    shadows: [shadowStyleSmallBlur],
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w900);

// TextStyle playStyleBold16 = GoogleFonts.poppins(shadows: [
//   const Shadow(
//     color: Color.fromARGB(255, 29, 29, 29),
//     blurRadius: 1.0,
//     offset: Offset(1, 1),
//   ),
// ], color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900);

Shadow shadowStyleSmallBlur = const Shadow(
  color: Color.fromARGB(255, 15, 15, 15),
  blurRadius: 10.5,
  offset: Offset(1.5, 1.5),
);
Shadow shadowStyleBigBlur = const Shadow(
  color: Color.fromARGB(255, 15, 15, 15),
  blurRadius: 1.5,
  offset: Offset(1.5, 1.5),
);

TextStyle playStyleBold16 = GoogleFonts.poppins(
    color: kGreyColor, fontWeight: FontWeight.w700, fontSize: 17);

TextStyle playStyleBold20 = GoogleFonts.poppins(
    shadows: [shadowStyleSmallBlur],
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w900);

TextStyle playStyleBold34 = GoogleFonts.poppins(
    shadows: [shadowStyleSmallBlur],
    color: Colors.white,
    fontSize: 34,
    fontWeight: FontWeight.w900);

TextStyle playStyleBoldGrey20 = GoogleFonts.poppins(
    color: const Color.fromARGB(218, 235, 235, 235),
    fontSize: 20,
    fontWeight: FontWeight.w800);

TextStyle playStyleBoldWhite26CategoryName = GoogleFonts.poppins(
    shadows: [
      const Shadow(
        color: Color.fromARGB(255, 68, 68, 68),
        blurRadius: 0.1,
        offset: Offset(1, 1),
      ),
    ],
    color: const Color.fromARGB(255, 255, 255, 255),
    fontSize: 26,
    fontWeight: FontWeight.w800);

TextStyle playStyleBoldWhite26CategoryType = GoogleFonts.poppins(
    // shadows: [
    //   const Shadow(
    //     color: Color.fromARGB(255, 68, 68, 68),
    //     blurRadius: 0.1,
    //     offset: Offset(1, 1),
    //   ),
    // ],
    color: Colors.white.withOpacity(0.6),
    fontSize: 20,
    fontWeight: FontWeight.w800);

TextStyle playStyle14 = GoogleFonts.poppins(shadows: [
  const Shadow(
    color: Color.fromARGB(255, 102, 102, 102),
    blurRadius: 0.1,
    offset: Offset(1, 1),
  ),
], color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700);
