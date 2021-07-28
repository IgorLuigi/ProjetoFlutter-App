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
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.purpleAccent,
        backgroundColor: Color.fromRGBO(139, 0, 139, 0.8),
        title: Text('Principal'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_rounded),
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.RECEITA_LIST);
            }
          ),
          IconButton(
            icon: Icon(Icons.remove_circle_rounded),
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.DESPESA_LIST);
            }
          )
        ],
      ),
      body: ListView(),
    );
  }
} 
