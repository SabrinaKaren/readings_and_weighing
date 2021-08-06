// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weighing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeighingStore on _WeighingStoreBase, Store {
  final _$weighingListAtom = Atom(name: '_WeighingStoreBase.weighingList');

  @override
  List<String> get weighingList {
    _$weighingListAtom.reportRead();
    return super.weighingList;
  }

  @override
  set weighingList(List<String> value) {
    _$weighingListAtom.reportWrite(value, super.weighingList, () {
      super.weighingList = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_WeighingStoreBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_WeighingStoreBaseActionController =
      ActionController(name: '_WeighingStoreBase');

  @override
  dynamic newWeighing() {
    final _$actionInfo = _$_WeighingStoreBaseActionController.startAction(
        name: '_WeighingStoreBase.newWeighing');
    try {
      return super.newWeighing();
    } finally {
      _$_WeighingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weighingList: ${weighingList}
    ''';
  }
}