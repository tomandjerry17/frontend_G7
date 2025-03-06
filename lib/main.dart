import 'package:flutter/material.dart';
import 'pages/sign_up_page.dart'; // Import your SignUpPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Up',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
