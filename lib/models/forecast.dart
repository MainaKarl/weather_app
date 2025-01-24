class ForecastItem {
  final DateTime dateTime;
  final String description;
  final String icon;
  final double temperature;
  final int humidity;

  ForecastItem({
    required this.dateTime,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.humidity,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dateTime: DateTime.parse(json['dt_txt']),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: (json['main']['temp'] as num).toDouble(),
      humidity: json['main']['humidity'],
    );
  }
}

class Forecast {
  final List<ForecastItem> items;

  Forecast({required this.items});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['list'];
    List<ForecastItem> items = list.map((item) => ForecastItem.fromJson(item)).toList();

    return Forecast(items: items);
  }
}

