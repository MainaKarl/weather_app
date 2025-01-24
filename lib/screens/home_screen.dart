import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              // Trigger location-based weather fetching
              weatherProvider.fetchWeatherByLocation();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (_cityController.text.isNotEmpty) {
                      print('City entered: ${_cityController.text}');
                      weatherProvider.fetchWeatherByCity(_cityController.text);
                    } else {
                      print('City field is empty');
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Content
            if (weatherProvider.isLoading)
              Center(child: CircularProgressIndicator())
            else if (weatherProvider.errorMessage != null)
              Center(child: Text(weatherProvider.errorMessage!))
            else if (weatherProvider.currentWeather != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City: ${weatherProvider.currentWeather!.cityName}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Temperature: ${weatherProvider.currentWeather!.temperature}°C',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Description: ${weatherProvider.currentWeather!.description}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              else
                Center(child: Text('Search for a city or allow location access')),
          ],
        ),
      ),
    );
  }
}
