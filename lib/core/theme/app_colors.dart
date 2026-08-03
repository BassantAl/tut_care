import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color backgroundColor = Color(0xffFAFAFA);
  static const Color primary = Color(0xff4F46E5);
  static const Color secondary = Color(0xff14B8A6);
  static const Color neutral = Color(0xff71717A);
  static const Color smallText = Color(0xff464555);
  
  static const Color inputFieldBorderColor = Color(0xffC7C4D8);
  static const Color inputFeildBorderColor = inputFieldBorderColor; // Alias for compatibility

  static const Color cardColor = Colors.white;
  static const Color errorColor = Color(0xffEF4444);
  static const Color successColor = Color(0xff22C55E);
  static const Color warningColor = Color(0xffF59E0B);
  static const Color infoColor = Color(0xff3B82F6);
}
