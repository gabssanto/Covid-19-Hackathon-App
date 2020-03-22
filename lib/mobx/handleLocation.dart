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

  @action
  void setLocation(latitude, longitude, accuracy) {
    this.latitude = latitude;
    this.longitude = longitude;
    this.accuracy = accuracy;
  }
}
