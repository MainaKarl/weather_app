import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv for environment variables

class WeatherApiService {
  // Fetch weather data by coordinates (latitude and longitude)
  Future<Map<String, dynamic>> fetchWeatherByCoords(double latitude, double longitude) async {
    final baseUrl = dotenv.env['BASE_URL']!;
    final apiKey = dotenv.env['API_KEY']!;
    final url = Uri.parse('$baseUrl/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather by coordinates');
    }
  }

  // Fetch forecast data by coordinates (latitude and longitude)
  Future<Map<String, dynamic>> fetchForecastByCoords(double latitude, double longitude) async {
    final baseUrl = dotenv.env['BASE_URL']!;
    final apiKey = dotenv.env['API_KEY']!;
    final url = Uri.parse('$baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch forecast by coordinates');
    }
  }

  // Fetch weather data by city name
  Future<Map<String, dynamic>> fetchWeatherByCity(String city) async {
    final baseUrl = dotenv.env['BASE_URL']!;
    final apiKey = dotenv.env['API_KEY']!;
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather for city');
    }
  }

  // Fetch forecast data by city name
  Future<Map<String, dynamic>> fetchForecastByCity(String city) async {
    final baseUrl = dotenv.env['BASE_URL']!;
    final apiKey = dotenv.env['API_KEY']!;
    final url = Uri.parse('$baseUrl/forecast?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch forecast for city');
    }
  }
}
