import 'package:app/app/database/sqlite/DAO/receita_DAO_impl.dart';
import 'package:app/app/domain/interfaces/services/receita_service.dart';
import 'package:get_it/get_it.dart';

import 'database/sqlite/DAO/despesa_DAO_impl.dart';
import 'domain/despesa_DAO.dart';
import 'domain/interfaces/services/despesa_service.dart';
import 'domain/receita_DAO.dart';

setupinjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ReceitaDAO>(ReceitaDAOImpl());
  getIt.registerSingleton<DespesaDAO>(DespesaDAOImpl());

  getIt.registerSingleton<ReceitaService>(ReceitaService());
  getIt.registerSingleton<DespesaService>(DespesaService());
}