class Current {
  final double temp;
  final double feelsLike; // Correct field name
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double? windMph;
  // final Weather weather; // Assuming a separate Weather class for description/details
  // final Wind wind; // Assuming a separate Wind class for wind details

  Current({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    this.windMph,
    // required this.weather,
    // required this.wind,
  });

  /// Factory constructor to parse JSON data for current weather
  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      windMph: json['wind_mph']?.toDouble(),
      // weather: Weather.fromJson(json['weather']), // Assuming a separate Weather class
      // wind: Wind.fromJson(json['wind']), // Assuming a separate Wind class
    );
  }

  /// Converts Current back into JSON
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      // 'weather': weather.toJson(),
      // 'wind': wind.toJson(),
    };
  }
}
