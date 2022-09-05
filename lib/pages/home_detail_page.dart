import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: context.theme.canvasColor,

      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
      
          children: [
            "\$${catalog.price}".text.bold.xl3.make().px16(),
      
            AddToCart(catalog: catalog,).wh(120, 50)
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.accentColor).bold.make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).center.make(),

                      "Elitr rebum et sit stet duo, et gubergren ipsum ea eos tempor tempor est. Sea gubergren nonumy gubergren eos eos,.".text.
                      textStyle(context.captionStyle).make().py16(),
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