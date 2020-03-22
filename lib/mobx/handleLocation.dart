import 'package:mobx/mobx.dart';
part 'handleLocation.g.dart';

class HandleLocation = _HandleLocationBase with _$HandleLocation;

abstract class _HandleLocationBase with Store {
  @observable
  double latitude;

  @observable
  double longitude;

  @observable
  double accuracy;

  @observable
  List ubsLatitudes;
  @observable
  List ubsLongitudes;
  @observable
  List ubsNames;
  @observable
  List ubsPlaces;
  @observable
  List ubsNumbers;
  @observable
  List ubsCeps;
  @observable
  List ubsUfs;
  @observable
  List ubsCities;

  @action
  void setLocation(latitude, longitude, accuracy) {
    this.latitude = latitude;
    this.longitude = longitude;
    this.accuracy = accuracy;
  }

  @action
  void setUBS(latitude, longitude, name, place, number, cep, uf, city) {
    this.ubsLatitudes = latitude;
    this.ubsLongitudes = longitude;
    this.ubsNames = name;
    this.ubsPlaces = place;
    this.ubsNumbers = number;
    this.ubsCeps = cep;
    this.ubsUfs = uf;
    this.ubsCities = city;
  }
}
