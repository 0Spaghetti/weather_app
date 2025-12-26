import 'dart:async'; // مكتبة التوقيت
import 'package:flutter/material.dart';
import 'weather_page.dart'; // استيراد الصفحة الرئيسية للانتقال إليها

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // مؤقت لمدة 3 ثوانٍ ثم ينتقل للصفحة الرئيسية
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
          // تدرج لوني جميل مشابه لتطبيق الطقس
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. أيقونة التطبيق الكبيرة
            const Icon(
              Icons.cloud_circle,
              size: 100,
              color: Colors.white,
            ),

            const SizedBox(height: 20),

            // 2. اسم التطبيق
            const Text(
              "تطبيق الطقس",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            // دائرة تحميل صغيرة
            const CircularProgressIndicator(
              color: Colors.white,
            ),

            const SizedBox(height: 50),

            // 3. اسمك (حقوق التطوير)
            const Text(
              "تطوير الطالبين:",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              "مهند & محمد", // ⚠️ اكتب اسمك هنا
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