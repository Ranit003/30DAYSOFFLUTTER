import 'dart:convert';
import 'package:day4/models/cart.dart';
import 'package:day4/widget/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/store.dart';
import '../models/catalog.dart';
import '../utils/routes.dart';
import '../widget/home_widgets/catalog_header.dart';
import '../widget/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days=30;

  final String name ="Codepur";
  //final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    readJson();
  }
    readJson() async {
    await Future.delayed(Duration(seconds:2));
      final catalogJson = await rootBundle.loadString('assets/files/catalog.json');
      //final response=await http.get(uri(host:url));
      //final catalogJson=response.body;
    //final decodeData=jsonDecode(catalog.json);
      final decodedData = await jsonDecode(catalogJson);
      var productsData=decodedData["products"];
      CatalogModel.items =List.from(productsData).map<Item>((item)=>Item.fromMap(item)).toList();
      setState(() {

      });

    }



  @override
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor:Theme.of(context).cardColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(ctx,_,status)=> FloatingActionButton(
          onPressed: ()=>Navigator.pushNamed(context,MyRoutes.CartRoute),
          backgroundColor: MyTheme.darkBulishColor,
           child:Icon(CupertinoIcons.cart,color: Colors.white),
    ).badge(color:Vx.red500,size: 25,count: _cart.items.length,textStyle:TextStyle(
          color: Colors.black,fontWeight: FontWeight.bold,
        )),
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
              else CircularProgressIndicator().centered().expand(),


            ],
          ),
        ),
      ),
      );
  }
}









