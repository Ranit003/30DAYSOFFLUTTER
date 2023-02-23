import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';

import '../../utils/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name=' ';
  bool changeButton=false;

  final _formkey=GlobalKey<FormState>();
  moveToHome(BuildContext context) async{
    if(_formkey.currentState!.validate()) {
      setState(() {

      changeButton=true;
    });
    }
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context,MyRoutes.homeRoute);
    setState(() {
      changeButton=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        child:SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column (
               children: [ Image.asset('assets/images/login_image.png',
              fit:BoxFit.cover,
               ),
              const SizedBox(
               height:20.0,
              ),

             Text(
              'Welcome $name',
              style:const TextStyle(
                fontSize:24.0,
                fontWeight: FontWeight.bold,

              ),
            ),

              const SizedBox(
                height:20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),

                child: Column(
                  children: [
                    TextFormField(
                      decoration:const  InputDecoration(
                        hintText:'Enter username',
                        labelText:"Username",
                      ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return "Username can't be empty";
                    }

                    return null;
                  },
                      onChanged: (value){
                        name=value;
                        setState(() {

                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText:'Enter password',
                        labelText:"password",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                    ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  // ElevatedButton(onPressed:( ){
                  //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                  // },
                  //   style: TextButton.styleFrom(minimumSize:const  Size(150, 100)),
                  //     child:const Text('login'),
                  //
                  // ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 20 : 8.0),
                    child: InkWell(
                      onTap: ()=> moveToHome(context),
                      child: AnimatedContainer(
                        duration:const Duration(seconds:1) ,
                        width:changeButton ? 50 : 150,
                        height: 50,
                        //color: Colors.deepPurple,
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //     color: Colors.deepPurple,
                        //     //  shape: changeButton
                        //     //      ?BoxShape.circle
                        //     //  :BoxShape.rectangle,
                        // ),
                        child: changeButton?const Icon(Icons.done,color: Colors.white,): const Text(
                          'login',
                          style: TextStyle(
                              color:Colors.white,fontWeight: FontWeight.bold,fontSize:22),

                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
               ],
            ),
          ),
        ));
  }
}
