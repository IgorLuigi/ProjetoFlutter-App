
import 'package:app/app/database/entities/despesa.dart';
import 'package:get_it/get_it.dart';

import '../../despesa_DAO.dart';





class DespesaService{
  //var daodespesa = DespesaDAOImpl();
  var _daodespesa = GetIt.I.get<DespesaDAO>();

  save(Despesa despesa){
    validateDescricao(despesa.descricao);
    _daodespesa.save(despesa);
  }

  remove(int id) async{
    await _daodespesa.remove(id);
  }

  Future<List<Despesa>> find(){
    return _daodespesa.find();
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