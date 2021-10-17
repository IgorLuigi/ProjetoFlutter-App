import 'package:app/app/database/entities/despesa.dart';
import 'package:app/app/domain/interfaces/services/despesa_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'despesa_list_back.g.dart';

class DespesaListBack = _DespesaListBack with _$DespesaListBack;

abstract class _DespesaListBack with Store{ 
  var _service = GetIt.I.get<DespesaService>();

  //lista de despesas
  @observable
  Future<List<Despesa>>list;

  //método para atualizar lista de despesa
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _DespesaListBack(){
    refreshList();
  }

  //método para chamar o formulário de despesas (salvar/alterar)
  goToForm(BuildContext context, [Despesa despesa]){
    Navigator.of(context).pushNamed(MyApp.DESPESA_FORM, arguments: despesa).then(refreshList);
  }

  goToDetails(BuildContext context, Despesa despesa){
    Navigator.of(context).pushNamed(MyApp.DESPESA_DETAILS, arguments: despesa);
  }

  //excluir
  remove(int id, BuildContext context) async{
    await _service.remove(id);
    refreshList;
    Navigator.of(context).pop();
  }
}