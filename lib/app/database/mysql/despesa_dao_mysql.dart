import 'dart:convert';

import 'package:app/app/database/entities/despesa.dart';
import 'package:app/app/domain/despesa_DAO.dart';
import 'package:http/http.dart' as http;

class DespesaDAOMySQL implements DespesaDAO{
  final uriRESTDESPESA = Uri.parse('http://192.168.25.52:8080/despesa');

  @override
  Future<List<Despesa>> find() async{
    var resposta = await http.get(uriRESTDESPESA);
    if(resposta.statusCode != 200) throw Exception('Erro REST API!');
    Iterable listDart = json.decode(resposta.body);
    var listDespesa = List<Despesa>.from(
      listDart.map((item) => Despesa(
        id: item['id'],
        descricao: item['descricao'],
        valor: item['valor'],
        data: item['data'],
      ))
    );

    return listDespesa;

  }


  @override
  remove(int id) async{
     var uri = Uri.parse('http://192.168.25.52:8080/despesa/$id');
    var resposta = await http.delete(uri);
    if(resposta.statusCode != 200) throw Exception('Erro REST API!');
  }
  
  
  @override
  save(Despesa despesa) async{
    var headers = {
      'Content-Type':'application/json'
    };
    var despesaJson = jsonEncode(
      {
        'id': despesa.id,
        'descricao': despesa.descricao,
        'valor': despesa.valor,
        'data': despesa.data,
      }
    );

    int statusCode = 0;
    if(despesa.id == null){
      var resposta = await http.post(uriRESTDESPESA, headers:headers, body:despesaJson);
      statusCode = resposta.statusCode;
    }
    else{
      var resposta = await http.put(uriRESTDESPESA, headers:headers, body:despesaJson);
      statusCode = resposta.statusCode;
    }
    if(statusCode != 200) throw Exception('Erro REST API!');

    }

}