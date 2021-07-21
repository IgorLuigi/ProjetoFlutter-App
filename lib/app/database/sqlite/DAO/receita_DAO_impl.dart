import 'package:app/app/database/entities/receita.dart';
import 'package:app/app/domain/receita_DAO.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class ReceitaDAOImpl implements ReceitaDAO{
  Database _db;

  @override
  Future<List<Receita>> find() async{
    _db = await Connection.get();
    List<Map<String,dynamic>>resultado = await _db.query('receita');
    List<Receita> listareceita = List.generate(resultado.length, (i){
      var linha = resultado[i];
      return Receita  (
        id: linha['id'],
        descricao: linha['descricao'],
        valor: linha['valor'],
        data: linha['data'] 
      );
    }
    );

    return listareceita;
  }

  @override
  remove(int id) async{
      _db = await Connection.get();
      var sql = 'DELETE FROM receita WHERE id = ?';
      _db.rawDelete(sql, [id]);
    }
  
    @override
    save(Receita receita) async{
    _db = await Connection.get();
    var sql;
    if(receita.id == null){
      sql = 'INSERT INTO receita(descricao, valor, data) VALUES(?,?,?)';
      _db.rawInsert(sql,[receita.descricao, receita.valor, receita.data]);
    }else{
      sql = 'UPDATE receita SET descricao = ?, valor = ?, data = ? WHERE id = ?)';
      _db.rawUpdate(sql,[receita.descricao, receita.valor, receita.data]);
    }
  }

}