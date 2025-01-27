import 'current_model.dart';
import 'location_model.dart';

class WeatherModel {
  final Location location; // Represents location/coordinates
  final Current current; // Represents current weather details

  WeatherModel({
    required this.location,
    required this.current,
  });

  /// Factory constructor to parse data from OpenWeather API JSON response
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: Location.fromJson({
        ...json['coord'],
        'country': json['sys']['country'],
        'name': json['name'],
      }), // 'coord' represents the location
      current: Current.fromJson({
        'weatherMain': json['weather'][0]['main'],
        'weatherDescription': json['weather'][0]['description'],
        'temp': json['main']['temp'],
        'feels_like': json['main']['feels_like'],
        'temp_min': json['main']['temp_min'],
        'temp_max': json['main']['temp_max'],
        'pressure': json['main']['pressure'],
        'humidity': json['main']['humidity'],
        'wind': json['wind'], // Wind details
      }),
    );
  }

  /// Converts this WeatherModel instance back into JSON
  Map<String, dynamic> toJson() {
    return {
      'coord': location.toJson(),
      'main': {
        'temp': current.temp,
        'feels_like': current.feelsLike,
        'temp_min': current.tempMin,
        'temp_max': current.tempMax,
        'pressure': current.pressure,
        'humidity': current.humidity,
      },
      'weather': [
        {
          'main': current.weatherMain,
          'description': current.weatherDescription,
        },
      ], // Weather details as a list
      // 'wind': current.wind.toJson(), // Wind details
    };
  }
}
