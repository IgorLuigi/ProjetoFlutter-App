import 'package:app/app/database/entities/despesa.dart';

abstract class DespesaDAO{
  
  save(Despesa despesa);

  remove(int id);

  Future<List<Despesa>>find();

}