import 'package:app/app/database/entities/receita.dart';
import 'package:app/app/domain/interfaces/services/receita_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'receita_list_back.g.dart';

class ReceitaListBack = _ReceitaListBack with _$ReceitaListBack;

abstract class _ReceitaListBack with Store{ 
  var _service = GetIt.I.get<ReceitaService>();

  //lista de receitas
  @observable
  Future<List<Receita>>list;

  //método para atualizar lista de receitas
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _ReceitaListBack(){
    refreshList();
  }

  //método para chamar o formulário de receitas (salvar/alterar)
  goToForm(BuildContext context, [Receita receita]){
    Navigator.of(context).pushNamed(MyApp.RECEITA_FORM, arguments: receita).then(refreshList);
  }

  //excluir
  remove(int id){
    _service.remove(id);
    refreshList;
  }

}