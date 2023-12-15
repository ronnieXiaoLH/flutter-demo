import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter row layout demo'),
        ),
        body: Center(child: buildRow()),
      ),
    );
  }

  Widget buildRow() =>
      // #docregion Row
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
          Icon(Icons.star, color: Colors.black),
        ],
      );
  // #enddocregion Row
}
