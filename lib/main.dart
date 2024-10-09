import 'package:flutter/material.dart';
import 'travel_app_animation/home_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter animation',
        themeMode: ThemeMode.system,
        home: MyHomePage(),
      ),
    );
  }
}
