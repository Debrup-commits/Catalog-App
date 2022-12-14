import 'dart:convert';

import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart'; 

import 'package:catalog_app/models/catalog.dart';
import '../widgets/home_widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalog_json=await rootBundle.loadString('assets/files/catalog.json');
    var decoded_data=jsonDecode(catalog_json);
    var product_data=decoded_data["products"];

    CatalogModel.items=List.from(product_data)
    .map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,

      floatingActionButton: FloatingActionButton(
        onPressed:()=>Navigator.pushNamed(context, MyRoutes.cartRoute), 
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
            
          ),
        ),
      ),
    );
  }
} 

