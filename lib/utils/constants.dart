class Constants {
  // API key
  static const apiKey = 'cfe577b09f43deea2722462eea76e473';

  // API URLs
  static const baseUrl = 'http://api.openweathermap.org/data/2.5';
  static const currentWeatherApiUrl = '$baseUrl/weather';
  static const forecastWeatherApiUrl = '$baseUrl/forecast';

  // API fields
  static const key = 'appid'; // OpenWeather API key parameter
  static const q = 'q'; // Query parameter for city name or location
  static const lat = 'lat'; // Latitude for geographic coordinates
  static const lon = 'lon'; // Longitude for geographic coordinates
  static const units = 'units'; // Units of measurement (metric, imperial, etc.)
  static const lang = 'lang'; // Language for API responses
  static const days = 'days';

  // Assets
  static const logo = 'assets/images/app_icon.png';
  static const welcome = 'assets/images/welcome.png';
  static const world = 'assets/images/world.png';
  static const world2 = 'assets/images/world2.png';
  static const noData = 'assets/images/no_data.png';
  static const search = 'assets/vectors/search.svg';
  static const language = 'assets/vectors/language.svg';
  static const category = 'assets/vectors/category.svg';
  static const downArrow = 'assets/vectors/down_arrow.svg';
  static const wind = 'assets/vectors/wind.svg';
  static const pressure = 'assets/vectors/pressure.svg';

  static const weatherAnimation = 'assets/data/weather_animation.json';
}
