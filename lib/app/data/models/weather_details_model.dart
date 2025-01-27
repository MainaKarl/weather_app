import 'package:weather_app/app/data/models/current_model.dart';
import 'condition_model.dart';
import 'location_model.dart';

class WeatherDetailsModel {
  Location? location;
  Current? current;
  List<DayForecast> dailyForecasts = [];
  List<Hour> hourlyForecasts = [];

  WeatherDetailsModel({
    this.location,
    required this.dailyForecasts,
  });

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    return WeatherDetailsModel(
      location: json['city'] != null ? Location.fromJson(json['city']) : null,
      dailyForecasts: json['list'] != null
          ? List<DayForecast>.from(json['list'].map((x) => DayForecast.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'city': location?.toJson(),
    'list': dailyForecasts.map((x) => x.toJson()).toList(),
  };
}

class Hour {
  DateTime? time;
  Main? main;
  WeatherCondition? condition;
  Wind? wind;
  Clouds? clouds;
  double? tempC;

  Hour({
    this.time,
    this.main,
    this.condition,
    this.wind,
    this.clouds,
    this.tempC
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    time: json['dt'] != null ? DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000) : null,
    main: json['main'] != null ? Main.fromJson(json['main']) : null,
    condition: json['condition'] != null ? WeatherCondition.fromJson(json['condition']) : null,
    wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
    clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
    tempC: json['main']?['temp']?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'dt': time!.millisecondsSinceEpoch ~/ 1000,
    'main': main?.toJson(),
    'condition': condition?.toJson(),
    'wind': wind?.toJson(),
    'clouds': clouds?.toJson(),
    'tempC': tempC,
  };
}

class DayForecast {
  DateTime? date;
  Main? main;
  List<WeatherCondition>? weather;
  Wind? wind;
  Clouds? clouds;

  DayForecast({
    this.date,
    this.main,
    this.weather,
    this.wind,
    this.clouds,
  });

  factory DayForecast.fromJson(Map<String, dynamic> json) => DayForecast(
    date: json['dt'] != null ? DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000) : null,
    main: json['main'] != null ? Main.fromJson(json['main']) : null,
    weather: json['weather'] != null
        ? List<WeatherCondition>.from(json['weather'].map((x) => WeatherCondition.fromJson(x)))
        : [],
    wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
    clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
  );

  Map<String, dynamic> toJson() => {
    'dt': date!.millisecondsSinceEpoch ~/ 1000,
    'main': main?.toJson(),
    'weather': weather?.map((x) => x.toJson()).toList(),
    'wind': wind?.toJson(),
    'clouds': clouds?.toJson(),
  };
}

class Main {
  double? temp;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json['temp']?.toDouble(),
    tempMin: json['temp_min']?.toDouble(),
    tempMax: json['temp_max']?.toDouble(),
    pressure: json['pressure'],
    humidity: json['humidity'],
  );

  Map<String, dynamic> toJson() => {
    'temp': temp,
    'temp_min': tempMin,
    'temp_max': tempMax,
    'pressure': pressure,
    'humidity': humidity,
  };
}

class WeatherCondition {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherCondition({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) => WeatherCondition(
    id: json['id'],
    main: json['main'],
    description: json['description'],
    icon: json['icon'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon,
  };
}

class Wind {
  double? speed;
  int? deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json['speed']?.toDouble(),
    deg: json['deg'],
  );

  Map<String, dynamic> toJson() => {
    'speed': speed,
    'deg': deg,
  };
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json['all'],
  );

  Map<String, dynamic> toJson() => {
    'all': all,
  };
}
