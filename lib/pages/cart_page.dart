import 'package:day4/core/store.dart';
import 'package:day4/models/cart.dart';
import 'package:day4/models/catalog.dart';
import 'package:day4/widget/themes.dart';
import 'package:flutter/cupertino.dart';
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
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),

        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
   _CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartModel _cart=(VxState.store as MyStore).cart;
    return  SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations:{RemoveMutation},
            builder: (context,_,status){
            return "\$${_cart.totalPrice}"
                .text.xl5.color(Colors.black).make();
              },
          ),
          30.widthBox,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:"Buying not supported yet "
                .text.make(),));
          },
            style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(context.theme.primaryColor)) ,
              child:"Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on:[RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    return _cart.items.isEmpty ? "Nothing to show".text.xl3.makeCentered():ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context,index)=>ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: ()=>RemoveMutation(_cart.items[index]),


        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}


