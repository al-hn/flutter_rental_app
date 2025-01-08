import 'package:flutter/material.dart';
import 'views/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Apartment Renting',
      home: SignUpPage(),
    );
  }
}