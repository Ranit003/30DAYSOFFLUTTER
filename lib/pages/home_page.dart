import 'dart:convert';
import 'package:day4/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import '../widget/home_widgets/catalog_header.dart';
import '../widget/home_widgets/catalog_list.dart';
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
                CatalogList().expand().py8()
              else CircularProgressIndicator().centered().expand(),


            ],
          ),
        ),
      ),
      );
  }
}









