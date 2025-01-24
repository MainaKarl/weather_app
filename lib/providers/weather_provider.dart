import 'package:flutter/cupertino.dart';
import 'package:weather_app/api/location_service.dart';
import 'package:weather_app/api/weather_api_service.dart';

import '../models/forecast.dart';
import '../models/weather.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherApiService _weatherApiService = WeatherApiService();
  final LocationService _locationService = LocationService();

  bool _isLoading = false;
  String? _errorMessage;
  Weather? _currentWeather;
  Forecast? _forecast;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Weather? get currentWeather => _currentWeather;
  Forecast? get forecast => _forecast;

  Future<void> fetchWeatherByCity(String city) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final weatherJson = await _weatherApiService.fetchWeatherByCity(city);
      final forecastJson = await _weatherApiService.fetchForecastByCity(city);

      _currentWeather = Weather.fromJson(weatherJson);
      _forecast = Forecast.fromJson(forecastJson);
    } catch (error) {
      _errorMessage = 'Failed to fetch weather by city. $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      final latitude = position.latitude;
      final longitude = position.longitude;

      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final weatherJson = await _weatherApiService.fetchWeatherByCoords(latitude, longitude);
      final forecastJson = await _weatherApiService.fetchForecastByCoords(latitude, longitude);

      _currentWeather = Weather.fromJson(weatherJson);
      _forecast = Forecast.fromJson(forecastJson);
    } catch (error) {
      _errorMessage = 'Failed to fetch weather by location. $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
