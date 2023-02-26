import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData LightTheme(BuildContext context)=>ThemeData(
      primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      primarySwatch: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color:Colors.black),

      )
  );
  static ThemeData DarkTheme(BuildContext context)=>ThemeData(
      brightness: Brightness.dark,


  );
  //colors
static Color creamColor=Color(0xfff5f5f5);
static Color darkBulishColor=Color(0xff403b58);


}