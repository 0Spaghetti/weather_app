import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/settings_provider.dart';
import 'package:weather_app/utils/weather_utils.dart';

class DailyForecastItem extends StatelessWidget {
  final WeatherModel day;
  final int index;
  final VoidCallback onTap;

  const DailyForecastItem({
    super.key,
    required this.day,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context, listen: false);
    final date = DateTime.now().add(Duration(days: index + 1));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(38), // Corrected transparency
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withAlpha(51)), // Corrected transparency
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                DateFormat('EEEE', settings.language).format(date),
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Lottie.asset(
                    WeatherUtils.getWeatherAnimation(day.mainCondition),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${day.temperature.round()}°',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
