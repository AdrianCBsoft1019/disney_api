import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/movie_model.dart';

class ApiService {
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:8080';
    return 'http://10.0.2.2:8080';
  }

  // ── Películas ──────────────────────────────────────────────────────────────
  static Future<List<DisneyContent>> getMovies() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/movies'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((movie) => DisneyContent(
              id: movie['id'],
              title: movie['title'],
              year: movie['year'],
              poster: movie['poster'],
              backdrop: movie['backdrop'],
              type: movie['type'],
              description: movie['description'],
              genres: List<String>.from(movie['genres']),
              rating: (movie['rating'] as num).toDouble(),
              director: movie['director'],
            )).toList();
      } else {
        throw Exception('Error al cargar películas: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en ApiService.getMovies: $e');
      rethrow;
    }
  }

  // ── Series ─────────────────────────────────────────────────────────────────
  static Future<List<DisneyContent>> getSeries() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/series'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => DisneyContent(
              id: item['id']?.toString() ?? '',
              title: item['title'] ?? '',
              year: item['year']?.toString() ?? '',
              poster: item['poster'] ?? '',
              backdrop: item['backdrop'] ?? '',
              type: 'series',
              description: item['description'] ?? '',
              genres: List<String>.from(item['genres'] ?? []),
              rating: (item['rating'] as num? ?? 0).toDouble(),
              director: item['director'] ?? '',
            )).toList();
      } else {
        throw Exception('Error al cargar series: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en ApiService.getSeries: $e');
      return _localSeriesFallback();
    }
  }

  static List<DisneyContent> _localSeriesFallback() {
    return [
      DisneyContent(id: 's1', title: 'Loki', year: '2021', poster: 'https://m.media-amazon.com/images/M/MV5BZDU0MTQ0YWQtMmM0Yy00Y2FmLWI5OTktZWM1ODg5MGY4OTQ4XkEyXkFqcGc@._V1_QL75_UY281_CR18,0,190,281_.jpg', backdrop: '', type: 'series', description: 'El Dios del Engaño sale de la sombra de su hermano.', genres: ['Acción', 'Aventura', 'Fantasía'], rating: 8.2, director: 'Kate Herron'),
      DisneyContent(id: 's2', title: 'The Mandalorian', year: '2019', poster: 'https://m.media-amazon.com/images/M/MV5BNjgxZGM0OWUtZGY1MS00MWRmLTk2N2ItYjQyZTI1OThlZDliXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', backdrop: '', type: 'series', description: 'Un pistolero solitario en los confines de la galaxia.', genres: ['Acción', 'Ciencia Ficción'], rating: 8.7, director: 'Jon Favreau'),
      DisneyContent(id: 's3', title: 'WandaVision', year: '2021', poster: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqShyFAaVR_74PKEs35Ba8kZn2nDHh7P36QQ&s', backdrop: '', type: 'series', description: 'Wanda y Visión viven una vida suburbana ideal.', genres: ['Drama', 'Misterio'], rating: 7.9, director: 'Matt Shakman'),
      DisneyContent(id: 's4', title: 'Ahsoka', year: '2023', poster: 'https://es.web.img2.acsta.net/pictures/23/09/19/11/27/3320024.jpg', backdrop: '', type: 'series', description: 'Ahsoka Tano investiga una amenaza emergente.', genres: ['Acción', 'Sci-Fi'], rating: 7.8, director: 'Dave Filoni'),
      DisneyContent(id: 's5', title: 'Moon Knight', year: '2022', poster: 'https://m.media-amazon.com/images/M/MV5BNDAzNmYwZjgtNDc3YS00ZDMyLTk0MjktMTg4MGNmNGU3MjlhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', backdrop: '', type: 'series', description: 'Un empleado padece trastorno de identidad disociativa.', genres: ['Acción', 'Aventura'], rating: 7.3, director: 'Mohamed Diab'),
      DisneyContent(id: 's6', title: 'Andor', year: '2022', poster: 'https://lumiere-a.akamaihd.net/v1/images/andor_poster_eb4ef19e.jpeg', backdrop: '', type: 'series', description: 'Una nueva perspectiva de la galaxia de Star Wars.', genres: ['Acción', 'Drama'], rating: 8.4, director: 'Tony Gilroy'),
      DisneyContent(id: 's7', title: 'The Bear', year: '2022', poster: 'https://es.web.img3.acsta.net/pictures/22/06/10/16/53/5259982.jpg', backdrop: '', type: 'series', description: 'Un joven chef regresa a Chicago para dirigir la tienda de su familia.', genres: ['Drama', 'Comedia'], rating: 8.6, director: 'Christopher Storer'),
      DisneyContent(id: 's8', title: 'Shogun', year: '2024', poster: 'https://hips.hearstapps.com/hmg-prod/images/shogun-105-04461r-65f89ad62c488.jpg', backdrop: '', type: 'series', description: 'En el Japón de 1600, Lord Toranaga lucha por su vida.', genres: ['Drama', 'Historia'], rating: 8.8, director: 'Rachel Kondo'),
      DisneyContent(id: 's9', title: 'Bluey', year: '2018', poster: 'https://es.web.img2.acsta.net/pictures/21/01/19/15/30/3519161.jpg', backdrop: '', type: 'series', description: 'Una perrita de seis años vive aventuras con su familia.', genres: ['Animación', 'Familia'], rating: 9.4, director: 'Joe Brumm'),
      DisneyContent(id: 's10', title: 'The Simpsons', year: '1989', poster: 'https://wallpapers.com/images/featured/simpsons-h3y2bvkczepf50dr.jpg', backdrop: '', type: 'series', description: 'Las aventuras satíricas de una familia de clase trabajadora.', genres: ['Animación', 'Comedia'], rating: 8.7, director: 'Matt Groening'),
    ];
  }

  // ── Personajes — API oficial Disney ───────────────────────────────────────
  // Soporta paginación: pageSize máx recomendado = 50
  static Future<Map<String, dynamic>> getCharacters({int page = 1, int pageSize = 50}) async {
    try {
      final uri = Uri.parse(
        'https://api.disneyapi.dev/character?page=$page&pageSize=$pageSize',
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> data = json['data'] ?? [];
        final info = json['info'] ?? {};

        final characters = data.map((c) => DisneyCharacter(
              id: c['_id']?.toString() ?? '',
              name: c['name'] ?? '',
              imageUrl: c['imageUrl'] ?? '',
              movieTitle: _firstOf(c['films']) ??
                  _firstOf(c['tvShows']) ??
                  'Universo Disney',
              description: _buildDescription(c),
              allies: List<String>.from(c['allies'] ?? []),
              enemies: List<String>.from(c['enemies'] ?? []),
              films: List<String>.from(c['films'] ?? []),
              tvShows: List<String>.from(c['tvShows'] ?? []),
            )).toList();

        return {
          'characters': characters,
          'totalPages': info['totalPages'] ?? 1,
          'currentPage': page,
          'count': info['count'] ?? characters.length,
        };
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      print('Error en ApiService.getCharacters: $e');
      rethrow;
    }
  }

  // Buscar personaje por nombre
  static Future<List<DisneyCharacter>> searchCharacter(String name) async {
    try {
      final uri = Uri.parse(
        'https://api.disneyapi.dev/character?name=${Uri.encodeComponent(name)}',
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> data = json['data'] ?? [];
        return data.map((c) => DisneyCharacter(
              id: c['_id']?.toString() ?? '',
              name: c['name'] ?? '',
              imageUrl: c['imageUrl'] ?? '',
              movieTitle: _firstOf(c['films']) ??
                  _firstOf(c['tvShows']) ??
                  'Universo Disney',
              description: _buildDescription(c),
              allies: List<String>.from(c['allies'] ?? []),
              enemies: List<String>.from(c['enemies'] ?? []),
              films: List<String>.from(c['films'] ?? []),
              tvShows: List<String>.from(c['tvShows'] ?? []),
            )).toList();
      }
      return [];
    } catch (e) {
      print('Error en searchCharacter: $e');
      return [];
    }
  }

  // ── Helpers ────────────────────────────────────────────────────────────────
  static String? _firstOf(dynamic list) {
    if (list is List && list.isNotEmpty) return list[0].toString();
    return null;
  }

  static String _buildDescription(Map<String, dynamic> c) {
    final films = List<String>.from(c['films'] ?? []);
    final tvShows = List<String>.from(c['tvShows'] ?? []);
    final allies = List<String>.from(c['allies'] ?? []);
    final enemies = List<String>.from(c['enemies'] ?? []);

    final parts = <String>[];
    if (films.isNotEmpty) parts.add('Películas: ${films.take(3).join(', ')}');
    if (tvShows.isNotEmpty) parts.add('Series: ${tvShows.take(3).join(', ')}');
    if (allies.isNotEmpty) parts.add('Aliados: ${allies.take(3).join(', ')}');
    if (enemies.isNotEmpty) parts.add('Enemigos: ${enemies.take(2).join(', ')}');
    return parts.isNotEmpty ? parts.join('\n') : 'Personaje del universo Disney.';
  }

  // ── Película por ID ────────────────────────────────────────────────────────
  static Future<DisneyContent> getMovieById(String id) async {
    try {
      final response =
          await http.get(Uri.parse('https://devsapihub.com/api-movies/$id'));
      if (response.statusCode == 200) {
        final movie = jsonDecode(response.body);
        return DisneyContent(
          id: movie['id'],
          title: movie['title'],
          year: movie['year'],
          poster: movie['poster'],
          backdrop: movie['backdrop'],
          type: movie['type'],
          description: movie['description'],
          genres: List<String>.from(movie['genres']),
          rating: (movie['rating'] as num).toDouble(),
          director: movie['director'],
        );
      } else {
        throw Exception('Error al cargar película: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en ApiService.getMovieById: $e');
      rethrow;
    }
  }
}