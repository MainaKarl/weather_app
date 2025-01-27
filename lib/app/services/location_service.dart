import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class LocationService {
  // prevent making instance
  LocationService._();

  static final LocationService _instance = LocationService._();
  factory LocationService() => _instance;

  bool get isLocationNull => _locationData == null;

  Location location = Location();
  late PermissionStatus _permissionGranted;
  LocationData? _locationData;

  late bool _serviceEnabled;

  Future<bool> hasLocationPermission() async {
    var permissionStatus = await location.hasPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<String?> getCityFromLocation() async {
    if (_locationData == null) {
      await getUserLocation(); // Ensure location is available
    }
    if (_locationData != null) {
      return await _getCityFromCoordinates(_locationData!.latitude!, _locationData!.longitude!);
    }
    return null;
  }

  Future<String?> _getCityFromCoordinates(double latitude, double longitude) async {
    try {
      // Reverse geocoding using OpenStreetMap or Google Maps API (replace with your own API key)
      String apiUrl = 'https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=json';

      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data != null && data['address'] != null && data['address']['city'] != null) {
          return data['address']['city'];
        }
      }
    } catch (e) {
      print('Error fetching city: $e');
    }
    return null;
  }

  Future<LocationData?> getUserLocation() async {
    if (_locationData != null) {
      return _locationData!;
    }
    return await _determineLocation();
  }

  Future<LocationData?> _determineLocation() async {
    // check if the service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    // check if the permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    // get the user lat & long
    _locationData = await location.getLocation();
    return _locationData;
  }
}
