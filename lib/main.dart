import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'views/series_page.dart';

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
  String _currentPage = 'Home';

  void _onSearchTap() {
    // Implement search
  }

  void _onNavItemTap(String item) {
    setState(() {
      _currentPage = item;
    });
  }

  void _onSubscribeTap() {
    // Implement subscribe
  }

  Widget _buildBody() {
    switch (_currentPage) {
      case 'Series':
        return const SeriesPage();
      case 'Películas':
        return const Center(
          child: Text(
            'Películas - Próximamente',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      case 'Personajes':
        return const Center(
          child: Text(
            'Personajes - Próximamente',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      case 'Home':
      default:
        return const Center(
          child: Text(
            'Welcome to Disney API',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
    }
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
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }
}