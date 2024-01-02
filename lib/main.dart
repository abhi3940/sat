import 'package:flutter/material.dart';
import 'package:sat/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        
        useMaterial3: true,
      ).copyWith(
        primaryColor: Colors.blueAccent, // Use red as the primary color
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.blueAccent, // Use red as the primary color in the color scheme
        ),
      ),
      home: const HomePage(),
    );
  }
}
