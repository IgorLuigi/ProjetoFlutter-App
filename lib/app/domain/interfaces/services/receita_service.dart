

import 'dart:html';

import 'package:app/app/database/entities/receita.dart';
import 'package:get_it/get_it.dart';

import '../../receita_DAO.dart';


class ReceitaService{
  //var daoreceita = ReceitaDAOImpl();
  var _daoreceita = GetIt.I.get<ReceitaDAO>();

  save(Receita receita){
    validateDescricao(receita.descricao);
    _daoreceita.save(receita);
  }

  remove(int id){
    _daoreceita.remove(id);
  }

  Future<List<Receita>> find(){
    return _daoreceita.find();
  }


  validateDescricao (String descricao){
    var minimodescricao = 1;
    var maximodescricao = 100;

    if(descricao == null){
      throw new Exception("é necessário digitar a descrição do produto");
    }
    else if(descricao.length < minimodescricao){
      throw new Exception("é necessário digitar pelo menos $minimodescricao descrição do produto");
    }
    else if(descricao.length > maximodescricao){
      throw new Exception("ultrapassou o limete da descrição.");
    }
  }

  //adicionar validação de data e valor

}
