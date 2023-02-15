import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData LightTheme(BuildContext context)=>ThemeData(
      primaryTextTheme: GoogleFonts.latoTextTheme(),
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


}