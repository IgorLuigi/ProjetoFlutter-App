import 'package:app/app/database/entities/receita.dart';
import 'package:app/app/database/sqlite/DAO/receita_DAO_impl.dart';
import 'package:flutter/material.dart';

import '../my_app.dart';

class ReceitaWidgetList extends StatelessWidget {
  final listareceita = [
    {'descricao':'Salário','valor':'1800,00', 'data':'01/06/2021'},
    {'descricao':'Mesada','valor':'200,00', 'data':'02/06/2021'},
  ];

  Future<List<Receita>>_buscar()async{
    return ReceitaDAOImpl().find(); 
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          List<Receita>lista = futuro.data;
          return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Receitas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.RECEITA_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: listareceita.length,
        itemBuilder: (context, i){
          var receita = listareceita[i];
          var listTile = ListTile(
            title: Text(receita['descricao']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                  Text(receita["data"]),
                  Text(receita["valor"]),
              ],
            ),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: null),
                  IconButton(icon: Icon(Icons.delete), onPressed: null),
                ],
              )
            ),
            isThreeLine: true,
          );
          return listTile;
        },
      ),
    );
        }else{
          return Scaffold();
        }
      }
    );
  }
}
