import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color.fromARGB(255, 241, 110, 110);
Color secondaryColor = const Color.fromARGB(255, 30, 30, 30);
Color tertiaryColor = const Color.fromARGB(255, 79, 79, 79);
Color backgroundColor = const Color.fromARGB(255, 242, 242, 242);

BorderRadius borderRadius25 = BorderRadius.circular(25);
BorderRadius borderRadius35 = BorderRadius.circular(35);

// TextStyle montserrat32 = GoogleFonts.montserrat(
//   fontSize: 32,
//   fontWeight: FontWeight.bold,
// );
// TextStyle montserrat24 = GoogleFonts.montserrat(
//   fontSize: 24,
// );
// TextStyle montserrat24Semi = GoogleFonts.montserrat(
//   fontSize: 24,
//   fontWeight: FontWeight.w600,
// );
// TextStyle montserrat20 = GoogleFonts.montserrat(
//   fontSize: 20,
//   fontWeight: FontWeight.bold,
// );
// TextStyle lato20 = GoogleFonts.montserrat(
//   fontSize: 20,
//   fontWeight: FontWeight.w600,
// );

TextStyle monText(double size, Color color, [FontWeight fontWeight = FontWeight.normal,]) {
  return GoogleFonts.montserrat(fontSize: size, color: color, fontWeight: fontWeight);
}

TextStyle laText(double size, Color color, [FontWeight fontWeight = FontWeight.normal]) {
  return GoogleFonts.lato(fontSize: size, color: color, fontWeight: fontWeight);
}

BoxShadow dropShadow = BoxShadow(
  color: Colors.black.withOpacity(0.15),
  blurRadius: 25,
  offset: const Offset(0, 8),
);
