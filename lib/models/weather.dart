class Weather {
  final String cityName;
  final String description;
  final String icon;
  final double temperature;
  final int humidity;

  Weather({
    required this.cityName,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: (json['main']['temp'] as num).toDouble(),
      humidity: json['main']['humidity'],
    );
  }
}
