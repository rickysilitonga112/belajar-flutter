import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xlophone App',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Text(faker.job.title()),
          ),
        ),
      ),
    );
  }
}
