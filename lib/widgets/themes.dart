import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes{
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
    cardColor: Colors.white,
    canvasColor: creamColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    buttonColor: darkBluishColor,
    accentColor: darkBluishColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,
    ),
  );

  static ThemeData darkTheme(BuildContext context)=>ThemeData(
    cardColor: Colors.black,
    canvasColor: darkColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    buttonColor: lightBlueColor,
    accentColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: Theme.of(context).textTheme,
    ),
  );

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBlueColor = Vx.indigo500;
}