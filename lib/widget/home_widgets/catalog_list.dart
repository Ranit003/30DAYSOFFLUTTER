import 'package:day4/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../widget/themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:CatalogModel.items.length,
      itemBuilder:(context, index){
        final catalog=CatalogModel.items;
        return InkWell(
            onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog))) ,
            child: CatalogItem(catalog:catalog));
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
        children:[
          Hero(
              tag:Key(catalog.id.toString()),
              child:CatalogImage(image: catalog.image)),
          Expanded(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [catalog.name.text.lg.color(MyTheme.darkBulishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:Vx.mOnly(right: 8),
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(context.primaryColor),
                          shape: MaterialStateProperty.all(StadiumBorder())
                      ),
                      child:"Add to cart".text.make())
                ],
              ),
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}
