import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),

      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.cartRoute ,
      routes: {
        MyRoutes.loginRoute: (context)=>LoginPage(),
        MyRoutes.homeRoute: (context)=>HomePage(),
        MyRoutes.cartRoute: (context)=>CartPage(),
      },
    );
  }
}
