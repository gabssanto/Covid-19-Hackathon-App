// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handleQuestions.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HandleQuestions on _HandleQuestionsBase, Store {
  final _$heightAtom = Atom(name: '_HandleQuestionsBase.height');

  @override
  double get height {
    _$heightAtom.context.enforceReadPolicy(_$heightAtom);
    _$heightAtom.reportObserved();
    return super.height;
  }

  @override
  set height(double value) {
    _$heightAtom.context.conditionallyRunInAction(() {
      super.height = value;
      _$heightAtom.reportChanged();
    }, _$heightAtom, name: '${_$heightAtom.name}_set');
  }

  final _$question1Atom = Atom(name: '_HandleQuestionsBase.question1');

  @override
  bool get question1 {
    _$question1Atom.context.enforceReadPolicy(_$question1Atom);
    _$question1Atom.reportObserved();
    return super.question1;
  }

  @override
  set question1(bool value) {
    _$question1Atom.context.conditionallyRunInAction(() {
      super.question1 = value;
      _$question1Atom.reportChanged();
    }, _$question1Atom, name: '${_$question1Atom.name}_set');
  }

  final _$_HandleQuestionsBaseActionController =
      ActionController(name: '_HandleQuestionsBase');

  @override
  void setHeight(dynamic height) {
    final _$actionInfo = _$_HandleQuestionsBaseActionController.startAction();
    try {
      return super.setHeight(height);
    } finally {
      _$_HandleQuestionsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'height: ${height.toString()},question1: ${question1.toString()}';
    return '{$string}';
  }
}
