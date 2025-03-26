import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context)
        .copyWith(textScaler: const TextScaler.linear(1.0));
    return MediaQuery(
      data: queryData,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter animation',
        home: MainPage(),
      ),
    );
  }
}
