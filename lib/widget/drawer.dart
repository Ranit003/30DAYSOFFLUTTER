import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl='https://i.pinimg.com/550x/31/23/2f/31232fe4b51b47763282524f008d9081.jpg';
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('Ranit Tatrial'),
                accountEmail: Text('ranitdqs@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),

              ),
            ),
            const ListTile(
              leading:Icon(CupertinoIcons.home,
                color:Colors.green,
              ),
              title: Text('Home',style:TextStyle(
                color: Colors.green,
              ) ,
              ),
            ),
            const ListTile(
              leading:Icon(CupertinoIcons.profile_circled,
                color: Colors.green,
              ),
              title: Text('Profile',style:TextStyle(
                color: Colors.green,
              ) ,
              ),
            ),
            const ListTile(
              leading:Icon(CupertinoIcons.mail,
                color: Colors.green,
              ),
              title: Text('Email me',style:TextStyle(
                color: Colors.green,
              ) ,
              ),
            ),
          ],
        ),

      ),
    );
  }
}