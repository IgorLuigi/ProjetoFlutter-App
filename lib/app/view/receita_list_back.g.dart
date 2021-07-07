// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receita_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReceitaListBack on _ReceitaListBack, Store {
  final _$listAtom = Atom(name: '_ReceitaListBack.list');

  @override
  Future<List<Receita>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Receita>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ReceitaListBackActionController =
      ActionController(name: '_ReceitaListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ReceitaListBackActionController.startAction(
        name: '_ReceitaListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ReceitaListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
