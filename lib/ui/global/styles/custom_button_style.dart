import 'package:flutter/material.dart';

class CustomButtonStyles {
  static ButtonStyle get fillIndigoA => ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF5668FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );
  static ButtonStyle get fillRed => ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFFFF8D6F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );
  static ButtonStyle get fillPink => ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFFFF5AA0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );
  static ButtonStyle get fillGreen => ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF009199),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );
  static ButtonStyle get outlined => OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF252525),
        backgroundColor: const Color(0XFFFCFCFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      );
}
