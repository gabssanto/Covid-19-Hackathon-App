// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handleLocation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HandleLocation on _HandleLocationBase, Store {
  final _$latitudeAtom = Atom(name: '_HandleLocationBase.latitude');

  @override
  double get latitude {
    _$latitudeAtom.context.enforceReadPolicy(_$latitudeAtom);
    _$latitudeAtom.reportObserved();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.context.conditionallyRunInAction(() {
      super.latitude = value;
      _$latitudeAtom.reportChanged();
    }, _$latitudeAtom, name: '${_$latitudeAtom.name}_set');
  }

  final _$longitudeAtom = Atom(name: '_HandleLocationBase.longitude');

  @override
  double get longitude {
    _$longitudeAtom.context.enforceReadPolicy(_$longitudeAtom);
    _$longitudeAtom.reportObserved();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.context.conditionallyRunInAction(() {
      super.longitude = value;
      _$longitudeAtom.reportChanged();
    }, _$longitudeAtom, name: '${_$longitudeAtom.name}_set');
  }

  final _$accuracyAtom = Atom(name: '_HandleLocationBase.accuracy');

  @override
  double get accuracy {
    _$accuracyAtom.context.enforceReadPolicy(_$accuracyAtom);
    _$accuracyAtom.reportObserved();
    return super.accuracy;
  }

  @override
  set accuracy(double value) {
    _$accuracyAtom.context.conditionallyRunInAction(() {
      super.accuracy = value;
      _$accuracyAtom.reportChanged();
    }, _$accuracyAtom, name: '${_$accuracyAtom.name}_set');
  }

  final _$_HandleLocationBaseActionController =
      ActionController(name: '_HandleLocationBase');

  @override
  void setLocation(dynamic latitude, dynamic longitude, dynamic accuracy) {
    final _$actionInfo = _$_HandleLocationBaseActionController.startAction();
    try {
      return super.setLocation(latitude, longitude, accuracy);
    } finally {
      _$_HandleLocationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'latitude: ${latitude.toString()},longitude: ${longitude.toString()},accuracy: ${accuracy.toString()}';
    return '{$string}';
  }
}
