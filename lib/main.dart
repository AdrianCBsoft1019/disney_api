import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'views/home_view.dart';
import 'views/series_page.dart';
import 'views/movies_page.dart';
import 'views/suscription_page.dart';
import 'views/character_page.dart';

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

  void _onNavItemTap(String item) => setState(() => _currentPage = item);
  void _onSubscribeTap() => setState(() => _currentPage = 'Suscribirse');
  void _onSearchTap() {}

  Widget _buildBody() {
    switch (_currentPage) {
      case 'Series':
        return const SeriesPage();
      case 'Personajes':
        return const CharacterPage();
      case 'Suscribirse':
        return const SuscripcionPage();
      case 'Películas':
        return const MoviesPage();
      case 'Home':
      default:
        return const HomeView();
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
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }
}