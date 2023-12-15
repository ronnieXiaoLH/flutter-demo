import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(child: buildColumn()),
      ),
    );
  }

  Widget buildColumn() =>
      // #docregion Column
      const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
        ],
      );
  // #enddocregion Column
}
