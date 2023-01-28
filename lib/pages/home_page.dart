import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
 final int days=30;
 final String name ="codepur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
      ),
      body:Center(
        child:Container(
          child: Text ("Welcome to $days days of flutter by $name"),
        ),
      ),
      drawer:Drawer(),
    );
  }
}
