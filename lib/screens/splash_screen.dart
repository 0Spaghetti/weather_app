import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // 1. استيراد مكتبة لوتي
import 'weather_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // الانتقال للصفحة الرئيسية بعد 3 ثوانٍ
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WeatherPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // خلفية متدرجة
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 2. استبدال الأيقونة الثابتة بأنيميشن متحرك
            Lottie.asset(
              'lib/assets/sunny.json', // مسار ملف الأنيميشن
              height: 200, // التحكم بالحجم
            ),

            const SizedBox(height: 20),

            const Text(
              "Weather App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            const CircularProgressIndicator(
              color: Colors.white,
            ),

            const SizedBox(height: 50),

            const Text(
              "Developed by:",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "Dev: مهند & محمد", // ⚠️ لا تنس كتابة اسمك
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}