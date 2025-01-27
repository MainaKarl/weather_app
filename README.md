# WeatherApp

WeatherApp is a mobile application built with Flutter (Dart) that fetches and displays real-time weather data using the OpenWeather API. The app provides an intuitive interface to display current weather conditions, such as temperature, humidity, and weather descriptions, for selected cities or locations.

## Features

- Fetches real-time weather data using the OpenWeather API.
- Displays weather information including:
  - Current temperature
  - Humidity
  - Weather description
  - Wind speed
- Supports dynamic city/location-based weather updates.
- Clean and modern UI design.

## Requirements

To run this project, you need the following:

- Flutter SDK (latest stable version)
- Dart SDK (bundled with Flutter)
- An IDE or text editor (such as Android Studio, VS Code, or IntelliJ IDEA) configured for Flutter development
- An OpenWeather API key (sign up at [OpenWeather](https://openweathermap.org/) to obtain your API key)

## Getting Started

Follow these steps to set up and run the application locally:

### 1. Clone the Repository
```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Configure API Key
- Create a `.env` file in the root of the project.
- Add your OpenWeather API key to the file:
  ```
  OPENWEATHER_API_KEY=your_api_key_here
  ```

### 3. Install Dependencies
Run the following commands to fetch and upgrade the required dependencies:
```bash
flutter pub get
flutter pub upgrade
```

### 4. Run the Application
To start the application on an emulator or physical device:
```bash
flutter run
```

## Project Structure

The project follows a modular structure for scalability and maintainability:

```
lib/
|- app/           
|- config/        
|- utils/         
|- main.dart    
```

## Screenshots

(Add relevant screenshots here to showcase the app design and functionality.)

## Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes with clear messages.
4. Submit a pull request.


Happy coding!

