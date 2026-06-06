import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() {
  runApp(const KrsApp());
}

class KrsApp extends StatelessWidget {
  const KrsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adzkia KRS Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0d47a1),
          primary: const Color(0xff0d47a1),
          secondary: const Color(0xffe53935),
        ),
        scaffoldBackgroundColor: const Color(0xfff4f7fb),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Color(0xff0d47a1),
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginPage(),
    );
  }
}