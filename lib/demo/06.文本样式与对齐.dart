import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: Scaffold(
        body: Center(
          child: Container(
            // grey box
            width: 320,
            height: 240,
            color: Colors.grey[300],
            child: const Text(
              'Lorem ipsum',
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
