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

![Screenshot_2025-01-27_23_55_51](https://github.com/user-attachments/assets/8c645aa0-626d-483d-825c-376de30a7723)
![Screenshot_2025-01-28_00-13-38](https://github.com/user-attachments/assets/65c3f70c-6d4b-481f-8b65-81f5ebfafd48)
![Screenshot_2025-01-28_00-14-25](https://github.com/user-attachments/assets/1140869b-f4e4-4f88-89b1-a21424f0c308)
![Screenshot_2025-01-28_00-18-40](https://github.com/user-attachments/assets/17dbe985-b2cd-4fb1-8aee-4e01abf16d7c)
![Screenshot_2025-01-28_00-19-19](https://github.com/user-attachments/assets/4734a3ac-2cd7-4197-9470-7905fad2b86b)
![Screenshot_2025-01-28_00-20-05](https://github.com/user-attachments/assets/da7ac0a3-bbd1-4656-998d-95782559fee9)
![Screenshot_2025-01-28_00-20-28](https://github.com/user-attachments/assets/beaf3e74-9f83-4442-a58c-bd5f98100420)


## Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes with clear messages.
4. Submit a pull request.


Happy coding!

