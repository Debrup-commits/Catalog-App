import 'dart:collection';
import 'dart:convert';

import 'package:catalog_app/widgets/themes.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart'; 

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';

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
      backgroundColor: MyThemes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else Center(
                child: CircularProgressIndicator().centered().expand(),
              )
            ],
          ),
        ),
      ),
    );
  }
} 

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
          "Trending Products".text.xl2.make(),
        ]
      );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog=CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});
  

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                catalog.name.text.lg.color(MyThemes.darkBluishColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),

                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,

                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),

                    ElevatedButton(
                      onPressed: (){}, 

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyThemes.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                      
                      child: "Buy".text.make()
                    )
                  ],
                ),
              ]
            ),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyThemes.creamColor).make().p16().w40(context);
  }
}