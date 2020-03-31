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

  final _$yesNoAtom = Atom(name: '_HandleQuestionsBase.yesNo');

  @override
  List<dynamic> get yesNo {
    _$yesNoAtom.context.enforceReadPolicy(_$yesNoAtom);
    _$yesNoAtom.reportObserved();
    return super.yesNo;
  }

  @override
  set yesNo(List<dynamic> value) {
    _$yesNoAtom.context.conditionallyRunInAction(() {
      super.yesNo = value;
      _$yesNoAtom.reportChanged();
    }, _$yesNoAtom, name: '${_$yesNoAtom.name}_set');
  }

  final _$questionsAtom = Atom(name: '_HandleQuestionsBase.questions');

  @override
  List<dynamic> get questions {
    _$questionsAtom.context.enforceReadPolicy(_$questionsAtom);
    _$questionsAtom.reportObserved();
    return super.questions;
  }

  @override
  set questions(List<dynamic> value) {
    _$questionsAtom.context.conditionallyRunInAction(() {
      super.questions = value;
      _$questionsAtom.reportChanged();
    }, _$questionsAtom, name: '${_$questionsAtom.name}_set');
  }

  final _$_HandleQuestionsBaseActionController =
      ActionController(name: '_HandleQuestionsBase');

  @override
  void setQuestions(dynamic index, dynamic value) {
    final _$actionInfo = _$_HandleQuestionsBaseActionController.startAction();
    try {
      return super.setQuestions(index, value);
    } finally {
      _$_HandleQuestionsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastQuestion(dynamic index, dynamic value, dynamic limit) {
    final _$actionInfo = _$_HandleQuestionsBaseActionController.startAction();
    try {
      return super.setLastQuestion(index, value, limit);
    } finally {
      _$_HandleQuestionsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearQuestions() {
    final _$actionInfo = _$_HandleQuestionsBaseActionController.startAction();
    try {
      return super.clearQuestions();
    } finally {
      _$_HandleQuestionsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'height: ${height.toString()},yesNo: ${yesNo.toString()},questions: ${questions.toString()}';
    return '{$string}';
  }
}
