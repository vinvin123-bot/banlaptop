import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
} 

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();

  String temperature = '';
  String humidity = '';
  String description = '';
  String error = '';

  final String apiKey = "bda85b0b57d15125b1f7611d7b6dbb07"; // <-- thay vào đây

  Future<void> fetchWeather(String city) async {
    if (city.isEmpty) return;

    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=vi";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          temperature = "${data['main']['temp']} °C";
          humidity = "${data['main']['humidity']} %";
          description = data['weather'][0]['description'];
          error = '';
        });
      } else {
        setState(() {
          error = "❌ Thành phố không tồn tại!";
          temperature = '';
          humidity = '';
          description = '';
        });
      }
    } catch (e) {
      setState(() {
        error = "⚠️ Lỗi kết nối!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng thời tiết"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Nhập tên thành phố",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  fetchWeather(_controller.text.trim());
                },
                child: const Text("Xem thời tiết"),
              ),
            ),

            const SizedBox(height: 20),

            if (error.isNotEmpty)
              Text(error, style: const TextStyle(color: Colors.red)),

            if (temperature.isNotEmpty) ...[
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("🌡️ Nhiệt độ: $temperature"),
                      Text("💧 Độ ẩm: $humidity"),
                      Text("☁️ Mô tả: $description"),
                    ],
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}