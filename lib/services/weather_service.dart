import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const String apiKey = 'd0b5d0b5df6911813e6e6e7341bb3065';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';

  // ================= CITY NAME =================
  Future<WeatherModel> getWeather(String cityName, {String lang = 'ar'}) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric&lang=$lang',
      ),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<List<WeatherModel>> getForecast(
      String cityName, {String lang = 'ar'}) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/forecast?q=$cityName&appid=$apiKey&units=metric&lang=$lang',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['list'];

      return list
          .where((e) => e['dt_txt'].contains('12:00:00'))
          .map((e) => WeatherModel.fromForecastJson(e))
          .toList();
    } else {
      throw Exception('Failed to load forecast');
    }
  }

  Future<List<WeatherModel>> getHourlyForecast(
      String cityName, {String lang = 'ar'}) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/forecast?q=$cityName&appid=$apiKey&units=metric&lang=$lang',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['list'];

      return list.take(8).map((e) => WeatherModel.fromForecastJson(e)).toList();
    } else {
      throw Exception('Failed to load hourly forecast');
    }
  }

  // ================= COORDINATES =================
  Future<WeatherModel> getWeatherByCoordinates(
      double lat, double lon,
      {String lang = 'ar'}) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=$lang',
      ),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather by coordinates');
    }
  }

  Future<List<WeatherModel>> getForecastByCoordinates(
      double lat, double lon,
      {String lang = 'ar'}) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=$lang',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['list'];

      return list
          .where((e) => e['dt_txt'].contains('12:00:00'))
          .map((e) => WeatherModel.fromForecastJson(e))
          .toList();
    } else {
      throw Exception('Failed to load forecast by coordinates');
    }
  }

  Future<List<WeatherModel>> getHourlyByCoordinates(
      double lat, double lon,
      {String lang = 'ar'}) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=$lang',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['list'];

      return list.take(8).map((e) => WeatherModel.fromForecastJson(e)).toList();
    } else {
      throw Exception('Failed to load hourly by coordinates');
    }
  }

  // ================= GPS CITY (UI ONLY) =================
  Future<String> getCurrentCity() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        return "Tripoli";
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return "Tripoli";
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      return placemarks.first.locality ?? "Tripoli";
    } catch (_) {
      return "Tripoli";
    }
  }
}
