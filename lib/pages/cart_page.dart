import 'package:day4/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.canvasColor,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        title: "cart".text.xl6.color(Colors.black).make(),
      ),
    );
  }
}
