import 'package:api/api/bus_station.dart';
import 'package:api/models/station.dart';
import 'package:flutter/material.dart';

// provider 클래스 선언 : ChangeNotifier 를 상속 받아 생성한다.
class BusStationProvider extends ChangeNotifier {
  final BusStation _busStation = BusStation();

  List<StationDto> _stationList = [];
  List<StationDto> get stationList => _stationList;

  /// BusStation 클래스의 loadStation() 함수를 실행하여
  /// 데이터를 수집하고, 수집이 완료되면 구독자에게 전파하여 알리기
  loadStation() async {
    List<StationDto>? tempList = await _busStation.loadStation();
    _stationList = tempList!;
    notifyListeners();
  }
}
