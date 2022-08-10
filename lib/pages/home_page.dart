import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  dummy_list=List.generate(20, (index)=>CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog App"),
      ),
      body: ListView.builder(
        itemCount: dummy_list.length,
        itemBuilder: (context, index){
          return ItemWidget(item: dummy_list[index],);
        },
      ),
      drawer: MyDrawer(),
    );
  }
}