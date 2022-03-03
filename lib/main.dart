import 'package:easyorder/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ezee Order',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',

        primarySwatch: const MaterialColor(0xFFf26c48, <int, Color>{
          50: Color(0xFFf37b5a),
          100: Color(0xFFf5896d),
          200: Color(0xFFf6987f),
          300: Color(0xFFf7a791),
          400: Color(0xFFf9b6a4),
          500: Color(0xFFfac4b6),
          600: Color(0xFFfbd3c8),
          700: Color(0xFFfce2da),
          800: Color(0xFFfef0ed),
          900: Color(0xFFffffff)
        }),
        toggleableActiveColor: const Color(0xFFf26c48),
        scaffoldBackgroundColor: const Color(0xFFF2F5FA),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.white,
          filled: true,
          isDense: true,
        ),
      ),
      home: const Home(),
    );
  }
}
