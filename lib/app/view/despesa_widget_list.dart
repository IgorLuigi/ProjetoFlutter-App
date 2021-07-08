import 'package:app/app/database/entities/despesa.dart';
import 'package:app/app/view/despesa_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import '../my_app.dart';
import 'despesa_list_back.dart';

class DespesaWidgetList extends StatelessWidget {
  final _back = DespesaListBack();

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
          title: Text('Lista de Despesas'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.DESPESA_FORM);
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
                  List<Despesa> listadespesa = futuro.data;
                  return ListView.builder(
                    itemCount: listadespesa.length,
                    itemBuilder: (context, i) {
                      var despesa = listadespesa[i];
                      var listTile = ListTile(
                        title: Text(despesa.descricao),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(despesa.data),
                            Text(despesa.valor),
                          ],
                        ),
                        trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                iconEditButton((){
                                  _back.goToForm(context, despesa);
                                }),
                                iconRemoveButton(context, (){
                                  _back.remove(despesa.id);
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
