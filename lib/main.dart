import 'package:flutter/material.dart';
import 'package:quiz_crafter/model/quiz/quiz_model.dart';
import 'package:quiz_crafter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
  //* Refer this to add quiz manually
  addQuizManually();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
