import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import '../widget/drawer.dart';
import '../widget/item_widget.dart';

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
      appBar: AppBar(
        title: const Text("Catalog app",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child:(CatalogModel.items != null && CatalogModel.items.isNotEmpty)? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context,index){
            return ItemWidget(item: CatalogModel.items[index],
            );
          },
        )
            :const Center(
            child:CircularProgressIndicator(),
             )
      ),

      drawer:const MyDrawer()
      );
  }
}