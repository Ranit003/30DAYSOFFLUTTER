import 'dart:convert';
import 'package:day4/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import '../widget/drawer.dart';
import '../widget/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days=30;

  final String name ="Codepur";

  @override
  void initState() {
    super.initState();
    readJson();
  }
    readJson() async {
    await Future.delayed(Duration(seconds:2));
      final catalogJson = await rootBundle.loadString('assets/files/catalog.json');
      final decodedData = await jsonDecode(catalogJson);
      var productsData=decodedData["products"];
      CatalogModel.items =List.from(productsData).map<Item>((item)=>Item.fromMap(item)).toList();
      setState(() {

      });

    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyTheme.creamColor,
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
                Center(child:CircularProgressIndicator(),)


            ],
          ),
        ),
      ),
      );
  }
}



class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBulishColor).make(),
        "Trending products".text.xl2.make(),

      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:CatalogModel.items.length,
      itemBuilder:(context, index){
        final catalog=CatalogModel.items[index];
        return CatalogItem(catalog:catalog);
      },
    );
  }
}


class CatalogItem extends StatelessWidget {
 final Item catalog;

  const CatalogItem({super.key, required this.catalog}):assert(catalog!=null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children:[CatalogImage(image: catalog.image),
          Expanded(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [catalog.name.text.lg.color(MyTheme.darkBulishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:Vx.mOnly(right: 16),
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBulishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())
                      ),
                      child:"Buy".text.make())
                ],
              )
            ],
          ))
          ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) :assert(image!=null);
  @override
  Widget build(BuildContext context) {
    return Image.network(image,
    ).box.rounded.p16.color(MyTheme.creamColor).make().p16();
  }
}





