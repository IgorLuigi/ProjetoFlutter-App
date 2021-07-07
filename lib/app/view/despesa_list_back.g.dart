// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DespesaListBack on _DespesaListBack, Store {
  final _$listAtom = Atom(name: '_DespesaListBack.list');

  @override
  Future<List<Despesa>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Despesa>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_DespesaListBackActionController =
      ActionController(name: '_DespesaListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_DespesaListBackActionController.startAction(
        name: '_DespesaListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_DespesaListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
