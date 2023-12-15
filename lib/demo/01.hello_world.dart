import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: Scaffold(
        body: Center(
          child: Center(
            child: Text('Hello, world!'),
          ),
        ),
      ),
    );
  }
}
