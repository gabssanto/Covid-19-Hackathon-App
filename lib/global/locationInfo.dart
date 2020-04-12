import 'package:covid19/mobx/imports.dart';
import 'package:location/location.dart';

class LocationInfo {
  final double precision, contagionFactor;
  String name;
  final coordinates;

  LocationInfo({
    this.coordinates,
    this.name,
    this.precision,
    this.contagionFactor,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      name: json['nome'] as String,
      coordinates: json['ponto']['coordinates'] as List,
      precision: json['precisao'] as num,
      contagionFactor: json['fator_contagio'] as num,
    );
  }

  Map<String, dynamic> toJson() => {
        'nome': name,
        'precisao': handleLocations.accuracy,
        'fator_contagio': contagionFactor ?? 0,
        'ponto': {
          'coordinates': [
            handleLocations.longitude,
            handleLocations.latitude,
          ],
        }
      };

  String toString() => """LocationInfo: {
  nome: $name,
  precisao: $precision,
  fator_contagio: $contagionFactor,
  ponto: {
    coordinates: $coordinates,
  }
}""";

  void getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }

    _locationData = await location.getLocation();

    handleLocations.setLocation(_locationData.latitude, _locationData.longitude,
        _locationData.accuracy);

    print('Latitude: ${_locationData.latitude}');
    print('Longitude: ${_locationData.longitude}');
    print('Accuracy: ${_locationData.accuracy}');
  }
}

var globalLocation = new LocationInfo();
