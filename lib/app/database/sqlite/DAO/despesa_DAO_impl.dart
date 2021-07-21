import 'package:app/app/database/entities/despesa.dart';
import 'package:app/app/domain/despesa_DAO.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';


class DespesaDAOImpl implements DespesaDAO{
  Database _db;

  @override
  Future<List<Despesa>> find() async{
    _db = await Connection.get();
    List<Map<String,dynamic>>resultado = await _db.query('despesa');
    List<Despesa> listadespesa = List.generate(resultado.length, (i){
      var linha = resultado[i];
      return Despesa  (
        id: linha['id'],
        descricao: linha['descricao'],
        valor: linha['valor'],
        data: linha['data'] 
      );
    }
    );

    return listadespesa;
  }

  @override
  remove(int id) async{
      _db = await Connection.get();
      var sql = 'DELETE FROM despesa WHERE id = ?';
      _db.rawDelete(sql, [id]);
    }
  
    @override
    save(Despesa despesa) async{
    _db = await Connection.get();
    var sql;
    if(despesa.id == null){
      sql = 'INSERT INTO despesa(descricao, valor, data) VALUES(?,?,?)';
      _db.rawInsert(sql,[despesa.descricao, despesa.valor, despesa.data]);
    }else{
      sql = 'UPDATE despesa SET descricao = ?, valor = ?, data = ? WHERE id = ?)';
      _db.rawUpdate(sql,[despesa.descricao, despesa.valor, despesa.data]);
    }
  }

}