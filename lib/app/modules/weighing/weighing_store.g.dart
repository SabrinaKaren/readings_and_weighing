// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weighing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeighingStore on _WeighingStoreBase, Store {
  final _$weighingListAtom = Atom(name: '_WeighingStoreBase.weighingList');

  @override
  ObservableList<WeighingModel> get weighingList {
    _$weighingListAtom.reportRead();
    return super.weighingList;
  }

  @override
  set weighingList(ObservableList<WeighingModel> value) {
    _$weighingListAtom.reportWrite(value, super.weighingList, () {
      super.weighingList = value;
    });
  }

  final _$isAnalyzingAtom = Atom(name: '_WeighingStoreBase.isAnalyzing');

  @override
  bool get isAnalyzing {
    _$isAnalyzingAtom.reportRead();
    return super.isAnalyzing;
  }

  @override
  set isAnalyzing(bool value) {
    _$isAnalyzingAtom.reportWrite(value, super.isAnalyzing, () {
      super.isAnalyzing = value;
    });
  }

  final _$_WeighingStoreBaseActionController =
      ActionController(name: '_WeighingStoreBase');

  @override
  void saveWeighing(String id, String date, double weight) {
    final _$actionInfo = _$_WeighingStoreBaseActionController.startAction(
        name: '_WeighingStoreBase.saveWeighing');
    try {
      return super.saveWeighing(id, date, weight);
    } finally {
      _$_WeighingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _insertWeighing(WeighingModel weighingToInsert) {
    final _$actionInfo = _$_WeighingStoreBaseActionController.startAction(
        name: '_WeighingStoreBase._insertWeighing');
    try {
      return super._insertWeighing(weighingToInsert);
    } finally {
      _$_WeighingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateWeighing(WeighingModel weighingToUpdate) {
    final _$actionInfo = _$_WeighingStoreBaseActionController.startAction(
        name: '_WeighingStoreBase._updateWeighing');
    try {
      return super._updateWeighing(weighingToUpdate);
    } finally {
      _$_WeighingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteWeighing(String id) {
    final _$actionInfo = _$_WeighingStoreBaseActionController.startAction(
        name: '_WeighingStoreBase.deleteWeighing');
    try {
      return super.deleteWeighing(id);
    } finally {
      _$_WeighingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsAnalyzing() {
    final _$actionInfo = _$_WeighingStoreBaseActionController.startAction(
        name: '_WeighingStoreBase.changeIsAnalyzing');
    try {
      return super.changeIsAnalyzing();
    } finally {
      _$_WeighingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weighingList: ${weighingList},
isAnalyzing: ${isAnalyzing}
    ''';
  }
}
