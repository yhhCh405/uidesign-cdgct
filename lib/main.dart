import 'package:flutter/material.dart';
import 'package:ui_design_cdgct/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "EncodeSans",
          // primarySwatch: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.orange),
          ),
          iconTheme: const IconThemeData(color: Colors.orange)),
      home: const HomeView(),
    );
  }
}
