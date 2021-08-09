// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemStore on _ItemStoreBase, Store {
  final _$titleAtom = Atom(name: '_ItemStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$_ItemStoreBaseActionController =
      ActionController(name: '_ItemStoreBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_ItemStoreBaseActionController.startAction(
        name: '_ItemStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title}
    ''';
  }
}
