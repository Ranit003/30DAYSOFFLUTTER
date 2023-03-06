import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData LightTheme(BuildContext context)=>ThemeData(
      primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      primarySwatch: Colors.indigo,
      colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
      cardColor: Colors.white,
      canvasColor: MyTheme.creamColor,
      floatingActionButtonTheme:
      const FloatingActionButtonThemeData(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color:Colors.black),


      )
  );
  static ThemeData DarkTheme(BuildContext context)=>ThemeData(
      // brightness: Brightness.dark,
    fontFamily:GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: MyTheme.darkCreamColor,
      floatingActionButtonTheme:
      const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF6366F1),
        foregroundColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color:Colors.white),

      ),

  );
  //colors
static Color creamColor=Color(0xfff5f5f5);
static Color darkCreamColor=Vx.gray800;
static Color darkBulishColor=Color(0xff403b58);
static Color lightbluishColor=Vx.purple50;


}