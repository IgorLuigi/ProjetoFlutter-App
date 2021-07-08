import 'package:app/app/database/entities/receita.dart';
import 'package:app/app/view/receita_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../my_app.dart';

class ReceitaWidgetList extends StatelessWidget {
  final _back = ReceitaListBack();

  Widget iconEditButton(Function onPressed) {
    return IconButton(icon: Icon(Icons.edit), color: Colors.blueAccent, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(icon: Icon(Icons.delete), color: Colors.redAccent, onPressed:(){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Excluir'),
          content: Text('Deseja realmente excluir?'),
          actions: [
            FlatButton(
              child: Text('Não'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Sim'),
              onPressed: remove,
            ),
          ],
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Receitas'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.RECEITA_FORM);
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Receita> listareceita = futuro.data;
                  return ListView.builder(
                    itemCount: listareceita.length,
                    itemBuilder: (context, i) {
                      var receita = listareceita[i];
                      var listTile = ListTile(
                        title: Text(receita.descricao),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(receita.data),
                            Text(receita.valor),
                          ],
                        ),
                        trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                iconEditButton((){
                                  _back.goToForm(context, receita);
                                }),
                                iconRemoveButton(context, (){
                                  _back.remove(receita.id);
                                  Navigator.of(context).pop();
                                })
                              ],
                            )),
                        isThreeLine: true,
                      );
                      return listTile;
                    },
                  );
                }
              });
        }));
  }
}
