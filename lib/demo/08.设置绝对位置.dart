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
            child: Stack(
              children: [
                Positioned(
                  // red box
                  left: 24,
                  top: 24,

                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                    ),
                    child: const Text(
                      'Lorem ipsum',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
