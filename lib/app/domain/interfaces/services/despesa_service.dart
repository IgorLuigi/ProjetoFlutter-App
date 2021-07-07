
import 'package:get_it/get_it.dart';

import '../../despesa_DAO.dart';



class DespesaService{
  //var daodespesa = DespesaDAOImpl();
  var daodespesa = GetIt.I.get<DespesaDAO>();
}