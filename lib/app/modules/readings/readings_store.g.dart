// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadingsStore on _ReadingsStoreBase, Store {
  final _$readingsListAtom = Atom(name: '_ReadingsStoreBase.readingsList');

  @override
  ObservableList<ReadingsModel> get readingsList {
    _$readingsListAtom.reportRead();
    return super.readingsList;
  }

  @override
  set readingsList(ObservableList<ReadingsModel> value) {
    _$readingsListAtom.reportWrite(value, super.readingsList, () {
      super.readingsList = value;
    });
  }

  final _$isAnalyzingAtom = Atom(name: '_ReadingsStoreBase.isAnalyzing');

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

  final _$_ReadingsStoreBaseActionController =
      ActionController(name: '_ReadingsStoreBase');

  @override
  void saveReadings(String id, String date, String value) {
    final _$actionInfo = _$_ReadingsStoreBaseActionController.startAction(
        name: '_ReadingsStoreBase.saveReadings');
    try {
      return super.saveReadings(id, date, value);
    } finally {
      _$_ReadingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _insertReadings(ReadingsModel readingsToInsert) {
    final _$actionInfo = _$_ReadingsStoreBaseActionController.startAction(
        name: '_ReadingsStoreBase._insertReadings');
    try {
      return super._insertReadings(readingsToInsert);
    } finally {
      _$_ReadingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateReadings(ReadingsModel readingsToUpdate) {
    final _$actionInfo = _$_ReadingsStoreBaseActionController.startAction(
        name: '_ReadingsStoreBase._updateReadings');
    try {
      return super._updateReadings(readingsToUpdate);
    } finally {
      _$_ReadingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteReadings(String id) {
    final _$actionInfo = _$_ReadingsStoreBaseActionController.startAction(
        name: '_ReadingsStoreBase.deleteReadings');
    try {
      return super.deleteReadings(id);
    } finally {
      _$_ReadingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsAnalyzing() {
    final _$actionInfo = _$_ReadingsStoreBaseActionController.startAction(
        name: '_ReadingsStoreBase.changeIsAnalyzing');
    try {
      return super.changeIsAnalyzing();
    } finally {
      _$_ReadingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
readingsList: ${readingsList},
isAnalyzing: ${isAnalyzing}
    ''';
  }
}
