import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'constants/colors.dart';
import 'models/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney API',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onSearchTap() {
    // Implement search
  }

  void _onNavItemTap(String item) {
    // Implement navigation
  }

  void _onSubscribeTap() {
    // Implement subscribe
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            onSearchTap: _onSearchTap,
            onNavItemTap: _onNavItemTap,
            onSubscribeTap: _onSubscribeTap,
          ),
          const Expanded(child: Center(child: Text('Welcome to Disney API'))),
        ],
      ),
    );
  }
}
