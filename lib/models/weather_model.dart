class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCondition; // مثال: Clouds, Rain, Clear
  final String description;   // مثال: light rain
  final String iconCode;      // رمز الأيقونة من API
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.description,
    required this.iconCode,
    required this.humidity,
    required this.windSpeed,
  });

  // دالة لتحويل بيانات JSON القادمة من الموقع إلى بيانات يفهمها التطبيق
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] ?? '',
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}