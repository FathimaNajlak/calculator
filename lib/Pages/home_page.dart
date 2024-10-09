import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title; // Define a title property

  // Constructor to accept 'title' as a named parameter
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(title), // Use the title property in the AppBar
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
                context, '/calculator'); // Navigate to calculator page
          },
          child: const Text('Go to Calculator'),
        ),
      ),
    );
  }
}
