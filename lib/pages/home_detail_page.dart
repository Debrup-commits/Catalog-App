import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyThemes.creamColor,

      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
      
          children: [
            "\$${catalog.price}".text.bold.xl3.make().px16(),
      
            ElevatedButton(
              onPressed: (){}, 
      
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyThemes.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).py8(),
      ),

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).h32(context),

            Expanded(
              child: VxArc(
                height: 15,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,

                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(MyThemes.darkBluishColor).bold.make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).center.make(),
                    ],
                  ).p32(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}