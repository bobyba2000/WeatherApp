import 'package:location/location.dart';

class LocationUtility {
  static Future<bool> getPermission() async {
    Location location = Location();
    PermissionStatus status;
    bool locationPermission = false;
    locationPermission = await location.serviceEnabled();
    if (!locationPermission) {
      locationPermission = await location.requestService();
      if (!locationPermission) {
        return false;
      }
    }
    status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      status = await location.requestPermission();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  static Future<LocationData?> getLocation() async {
    if (await getPermission()) {
      return Location().getLocation();
    }
    return null;
  }
}
