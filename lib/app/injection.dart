
import 'package:app/app/domain/interfaces/services/receita_service.dart';
import 'package:get_it/get_it.dart';

import 'database/mysql/despesa_dao_mysql.dart';
import 'database/mysql/receita_dao_mysql.dart';
import 'domain/despesa_DAO.dart';
import 'domain/interfaces/services/despesa_service.dart';
import 'domain/receita_DAO.dart';

setupinjection(){
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ReceitaDAO>(ReceitaDAOMySQL());
  getIt.registerSingleton<DespesaDAO>(DespesaDAOMySQL());

  getIt.registerSingleton<ReceitaService>(ReceitaService());
  getIt.registerSingleton<DespesaService>(DespesaService());
}