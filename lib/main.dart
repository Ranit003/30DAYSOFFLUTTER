import 'package:day4/pages/login_page.dart';
import 'package:day4/utils/routes.dart';
import 'package:day4/widget/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.LightTheme(context),
      darkTheme:  MyTheme.DarkTheme(context),

      debugShowCheckedModeBanner: false,
      initialRoute:MyRoutes.homeRoute,
      routes: {
        '/':(context)=> const LoginPage(),
        MyRoutes.homeRoute:(context)=>const HomePage(),
        MyRoutes.loginRoute:(context)=>const LoginPage(),
      },
      //home:HomePage(),
    );
  }
}
