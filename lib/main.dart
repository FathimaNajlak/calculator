import 'package:calculator/Pages/Calculator.dart';
import 'package:calculator/Pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const MyHomePage(title: 'Welcome to Calculator'), // Pass title here
        '/calculator': (context) => const CalculatorPage(),
      },
    );
  }
}
