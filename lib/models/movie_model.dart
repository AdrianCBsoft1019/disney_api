class DisneyContent {
  final String id;
  final String title;
  final String year;
  final String poster;
  final String backdrop;
  final String type;
  final String description;
  final List<String> genres;
  final double rating;
  final String director;

  DisneyContent({
    required this.id,
    required this.title,
    required this.year,
    required this.poster,
    required this.backdrop,
    required this.type,
    required this.description,
    required this.genres,
    required this.rating,
    required this.director,
  });

  factory DisneyContent.fromJson(Map<String, dynamic> json) {
    return DisneyContent(
      id: json['id'] ?? '',
      title: json['title'] ?? 'Unknown',
      year: json['year'] ?? 'N/A',
      poster: json['poster'] ?? '',
      backdrop: json['backdrop'] ?? '',
      type: json['type'] ?? 'movie',
      description: json['description'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      rating: (json['rating'] ?? 0).toDouble(),
      director: json['director'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'poster': poster,
      'backdrop': backdrop,
      'type': type,
      'description': description,
      'genres': genres,
      'rating': rating,
      'director': director,
    };
  }
}

class ContentFilter {
  final String name;
  final String value;
  final bool isSelected;

  ContentFilter({
    required this.name,
    required this.value,
    this.isSelected = false,
  });

  ContentFilter copyWith({bool? isSelected}) {
    return ContentFilter(
      name: name,
      value: value,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class DisneyCharacter {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final String movieTitle;
  final List<String> allies;
  final List<String> enemies;
  final List<String> films;
  final List<String> tvShows;

  DisneyCharacter({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.movieTitle,
    this.description = '',
    this.allies = const [],
    this.enemies = const [],
    this.films = const [],
    this.tvShows = const [],
  });

  factory DisneyCharacter.fromJson(Map<String, dynamic> json) {
    return DisneyCharacter(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      movieTitle: json['movieTitle'] ?? '',
      description: json['description'] ?? '',
      allies: List<String>.from(json['allies'] ?? []),
      enemies: List<String>.from(json['enemies'] ?? []),
      films: List<String>.from(json['films'] ?? []),
      tvShows: List<String>.from(json['tvShows'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'movieTitle': movieTitle,
      'description': description,
      'allies': allies,
      'enemies': enemies,
      'films': films,
      'tvShows': tvShows,
    };
  }
}