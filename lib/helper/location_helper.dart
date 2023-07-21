import 'package:location/location.dart';
import 'package:flutter/foundation.dart';

class LocationHelper with ChangeNotifier {
  var _serviceEnabled;
  var _permissionGranted;
  var _locationData;

  Future<void> getLocation() async {
    var location = Location();
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await location.requestPermission();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    return _locationData;

    // location.onLocationChanged.listen((event) {});
  }
}
