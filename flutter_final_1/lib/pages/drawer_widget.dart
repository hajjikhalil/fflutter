import 'package:flutter/material.dart';
import 'package:projetflutterfinal/pages/membre.dart';

import 'Family.dart';
import 'composant.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children :[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.black12,
                          Colors.lightBlue,
                        ]

                    )
                ),

                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/gstock.png"),
                    radius: 50,
                  ),
                )),
            ListTile(
              title: Text("Family", style: TextStyle(fontSize:26),),
              leading: Icon(Icons.account_balance),
              trailing: Icon(Icons.arrow_right),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_)=> FamilyPage()));
              },
            ),
            Divider(height:5 ,color : Colors.black ,),

            ListTile(
              title: Text("Composant", style: TextStyle(fontSize:26),),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_right),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_)=> ComposantPage()));
              },
            ),
            Divider(height:5 ,color : Colors.black ,),
            ListTile(
              title: Text("Catégorie", style: TextStyle(fontSize:26),),
              trailing: Icon(Icons.arrow_right),
            ),
            Divider(height:5 ,color : Colors.black ,),
            ListTile(
              title: Text("Membre", style: TextStyle(fontSize:26),),
              trailing: Icon(Icons.arrow_right),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_)=> MembrePage()));
              },
            ),
            Divider(height:5 ,color : Colors.black ,),
            ListTile(
              title: Text("Déconnexion", style: TextStyle(fontSize:26),),
              leading: Icon(Icons.close ,),
              trailing: Icon(Icons.arrow_right),
            ),
            Divider(height:5 ,color : Colors.black ,),
          ],
        )
    );
  }
}