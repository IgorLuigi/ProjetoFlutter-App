//import 'dart:html';

import 'package:flutter/material.dart';

import '../my_app.dart';

class Principal extends StatefulWidget {
  const Principal({ key }) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(BuildContext context, BoxConstraints constraints){
        var width = constraints.biggest.width;


      return Scaffold(
        backgroundColor: Color.fromRGBO(139, 0, 139, 0.8),
        appBar: AppBar(
          //backgroundColor: Colors.purpleAccent,
          backgroundColor: Color.fromRGBO(139, 0, 139, 0.8),
          title: Text('App de Finanças'),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.add_circle_rounded),
          //     onPressed: (){
          //       Navigator.of(context).pushNamed(MyApp.RECEITA_LIST);
          //     }
          //   ),
          //   IconButton(
          //     icon: Icon(Icons.remove_circle_rounded),
          //     onPressed: (){
          //       Navigator.of(context).pushNamed(MyApp.DESPESA_LIST);
          //     }
          //   )
          // ],
        ),
        body: ListView(
          padding: EdgeInsets.all(60),
          children: [
            Center(
              child: Text('Suas Finanças', style: TextStyle(fontSize: 30, backgroundColor: Colors.purpleAccent),),
            ),
            Card(
              child: ListTile(
                title: Text('Receita:'),
                trailing: Container(
                  width: width/6,
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.purpleAccent,
                        icon: Icon(Icons.add_circle_rounded),
                        onPressed: (){
                          Navigator.of(context).pushNamed(MyApp.RECEITA_LIST);
                        }
                      )
                    ]
                  )
                )
              ), 
            ),
            Card(
               child: ListTile(
                title: Text('Receita:'),
                trailing: Container(
                  width: width/6,
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.purpleAccent,
                        icon: Icon(Icons.remove_circle_rounded),
                        onPressed: (){
                          Navigator.of(context).pushNamed(MyApp.DESPESA_LIST);
                        }
                      )
                    ]
                  )
                )
              ), 
            ),
          ],
        ),
      );
      },
    );
  }
} 
