import 'dart:convert';

import 'package:app/app/database/entities/receita.dart';
import 'package:app/app/domain/receita_DAO.dart';
import 'package:http/http.dart' as http;

class ReceitaDAOMySQL implements ReceitaDAO{
  final uriRESTRECEITA = Uri.parse('http://192.168.25.52:8080/receita');

  @override
    Future<List<Receita>> find() async{
    var resposta = await http.get(uriRESTRECEITA);
    if(resposta.statusCode != 200) throw Exception('Erro REST API!');
    Iterable listDart = json.decode(resposta.body);
    var listReceita = List<Receita>.from(
      listDart.map((item) => Receita(
        id: item['id'],
        descricao: item['descricao'],
        valor: item['valor'],
        data: item['data'],
      ))
    );

    return listReceita;
  }

  @override
  remove(id) async{
    var uri = Uri.parse('http://192.168.25.52:8080/receita/$id');
    var resposta = await http.delete(uri);
    if(resposta.statusCode != 200) throw Exception('Erro REST API!');
  }
  
  @override
  save(Receita receita) async{
    var headers = {
      'Content-Type':'application/json'
    };
    var receitaJson = jsonEncode(
      {
        'id': receita.id,
        'descricao': receita.descricao,
        'valor': receita.valor,
        'data': receita.data,
      }
    );

    int statusCode = 0;
    if(receita.id == null){
      var resposta = await http.post(uriRESTRECEITA, headers:headers, body:receitaJson);
      statusCode = resposta.statusCode;
    }
    else{
      var resposta = await http.put(uriRESTRECEITA, headers:headers, body:receitaJson);
      statusCode = resposta.statusCode;
    }
    if(statusCode != 200) throw Exception('Erro REST API!');
  }
}