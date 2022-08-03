import 'package:catalog_app/utils/routes.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main(){
  runApp(MyApp());
}

// bhai flutter bhi sikh loge, sab likh loge bas bhagwan mat ban jana

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      routes: {
        MyRoutes.loginRoute: (context)=>LoginPage(),
        MyRoutes.homeRoute: (context)=>HomePage(),
      },
    );
  }
}