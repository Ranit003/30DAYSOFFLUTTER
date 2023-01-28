import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../utils/routes.dart';


 class LoginPage extends StatelessWidget {
   const LoginPage({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return   Material(
         child:SingleChildScrollView(
           child: Column (
             children: [ Image.asset('assets/images/login_image.png',
               fit:BoxFit.cover,

             ),
             SizedBox(
               height:20.0,
             ),

             Text(
               'Welcome',
                   style:TextStyle(
                     fontSize:24.0,
                     fontWeight: FontWeight.bold,

             ),
             ),
               SizedBox(
                 height:20.0,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                 child: Column(
                   children: [
                     TextFormField(
                       decoration: InputDecoration(
                         hintText:'Enter username',
                         labelText:"Username",
                       ),
                     ),
                     TextFormField(
                     obscureText: true,
                       decoration: InputDecoration(
                         hintText:'Enter password',
                         labelText:"password",
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(
                 height: 20.0,
               ),
               ElevatedButton(onPressed:( ){
                 Navigator.pushNamed(context, MyRoutes.homeRoute);
               },
                   child: Text('login'),
                 style: TextButton.styleFrom(minimumSize: Size(150, 100)),

               ),
              ],

             

           ),
         )
     );
   }
 }
