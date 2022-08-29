import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: "Cart".text.textStyle(context.captionStyle).bold.xl.make(),  
      ),
      backgroundColor: MyThemes.creamColor,
    );
  }
}