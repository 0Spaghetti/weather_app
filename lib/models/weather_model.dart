class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;
  final String iconCode;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
    required this.iconCode,
  });

  /// CURRENT WEATHER
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] ?? '',
      temperature: (json['main']['temp'] as num).toDouble(),
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      iconCode: json['weather'][0]['icon'],
    );
  }

  /// FORECAST / HOURLY
  factory WeatherModel.fromForecastJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: '',
      temperature: (json['main']['temp'] as num).toDouble(),
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      sunrise: 0,
      sunset: 0,
      iconCode: json['weather'][0]['icon'],
    );
  }

  /// copyWith MUST BE HERE
  WeatherModel copyWith({
    String? cityName,
    double? temperature,
    String? mainCondition,
    String? description,
    int? humidity,
    double? windSpeed,
    int? sunrise,
    int? sunset,
    String? iconCode,
  }) {
    return WeatherModel(
      cityName: cityName ?? this.cityName,
      temperature: temperature ?? this.temperature,
      mainCondition: mainCondition ?? this.mainCondition,
      description: description ?? this.description,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      iconCode: iconCode ?? this.iconCode,
    );
  }
}
