import 'package:flutter/material.dart';

// ── Series data model ──────────────────────────────────────────────────────────
class Series {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final String year;
  final String seasons;
  final String genre;
  final double rating;
  final List<String> cast;

  const Series({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.year,
    required this.seasons,
    required this.genre,
    required this.rating,
    required this.cast,
  });
}

// ── Local data (real Disney+ series) ──────────────────────────────────────────
const List<Series> disneySeriesList = [
  Series(
    id: 1,
    title: 'The Mandalorian',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/6/67/The_Mandalorian_-_Season_1_poster.jpg',
    description:
        'After the fall of the Empire, a lone gunfighter makes his way through the outer reaches of the lawless galaxy. Set in the Star Wars universe, this series follows a mysterious bounty hunter protecting a sought-after foundling.',
    year: '2019',
    seasons: '3 Temporadas',
    genre: 'Acción / Sci-Fi',
    rating: 8.7,
    cast: [
      'Pedro Pascal',
      'Carl Weathers',
      'Giancarlo Esposito',
      'Gina Carano',
    ],
  ),
  Series(
    id: 2,
    title: 'WandaVision',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/8/80/WandaVision_cover_art.jpg',
    description:
        'Wanda Maximoff and Vision — two super-powered beings living idealized suburban lives — begin to suspect that everything is not as it seems. A blend of classic sitcom tropes and the Marvel Cinematic Universe.',
    year: '2021',
    seasons: '1 Temporada',
    genre: 'Drama / Fantasía',
    rating: 7.9,
    cast: ['Elizabeth Olsen', 'Paul Bettany', 'Kathryn Hahn', 'Teyonah Parris'],
  ),
  Series(
    id: 3,
    title: 'Loki',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/e/e7/Loki_TV_series_poster.jpg',
    description:
        'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of Avengers: Endgame, working with the Time Variance Authority.',
    year: '2021',
    seasons: '2 Temporadas',
    genre: 'Aventura / Sci-Fi',
    rating: 8.2,
    cast: [
      'Tom Hiddleston',
      'Owen Wilson',
      'Sophia Di Martino',
      'Gugu Mbatha-Raw',
    ],
  ),
  Series(
    id: 4,
    title: 'Andor',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/3/3d/Andor_TV_series_poster.jpg',
    description:
        'A prequel to Rogue One, this gritty spy thriller follows Cassian Andor\'s journey to becoming a Rebel spy. An exploration of how ordinary people are radicalized against an oppressive regime.',
    year: '2022',
    seasons: '2 Temporadas',
    genre: 'Drama / Spy-Fi',
    rating: 8.4,
    cast: [
      'Diego Luna',
      'Genevieve O\'Reilly',
      'Stellan Skarsgård',
      'Adria Arjona',
    ],
  ),
  Series(
    id: 5,
    title: 'The Bear',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/d/d8/The_Bear_TV_poster.jpg',
    description:
        'A young chef from the fine dining world comes home to Chicago to run his family\'s sandwich shop after a family tragedy. An intense, fast-paced drama about family, grief, and culinary ambition.',
    year: '2022',
    seasons: '3 Temporadas',
    genre: 'Drama / Comedia',
    rating: 8.7,
    cast: [
      'Jeremy Allen White',
      'Ebon Moss-Bachrach',
      'Ayo Edebiri',
      'Lionel Boyce',
    ],
  ),
  Series(
    id: 6,
    title: 'Hawkeye',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/9/98/Hawkeye_poster.jpg',
    description:
        'Set after the events of Avengers: Endgame, Clint Barton must partner with a young archer Kate Bishop to confront enemies from his past before he can return home for Christmas.',
    year: '2021',
    seasons: '1 Temporada',
    genre: 'Acción / Comedia',
    rating: 7.5,
    cast: [
      'Jeremy Renner',
      'Hailee Steinfeld',
      'Vera Farmiga',
      'Florence Pugh',
    ],
  ),
  Series(
    id: 7,
    title: 'Secret Invasion',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/9/91/Secret_Invasion_poster.jpg',
    description:
        'Nick Fury and Talos discover that a faction of shape-shifting Skrulls have been infiltrating Earth for years, hiding in plain sight at the highest levels of governments and societies.',
    year: '2023',
    seasons: '1 Temporada',
    genre: 'Thriller / Sci-Fi',
    rating: 6.1,
    cast: [
      'Samuel L. Jackson',
      'Ben Mendelsohn',
      'Cobie Smulders',
      'Emilia Clarke',
    ],
  ),
  Series(
    id: 8,
    title: 'The Acolyte',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/2/27/The_Acolyte_poster.jpg',
    description:
        'Set during the final days of the High Republic era, a mystery-thriller that investigates a series of shocking crimes set during the waning days of the Republic\'s golden age.',
    year: '2024',
    seasons: '1 Temporada',
    genre: 'Misterio / Sci-Fi',
    rating: 6.5,
    cast: ['Amandla Stenberg', 'Lee Jung-jae', 'Manny Jacinto', 'Dafne Keen'],
  ),
  Series(
    id: 9,
    title: 'Moon Knight',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/d/d1/Moon_Knight_poster.jpg',
    description:
        'A mercenary with dissociative identity disorder is drawn into a deadly mystery involving Egyptian gods while his alter ego, a meek museum gift shop employee, also fights for survival.',
    year: '2022',
    seasons: '1 Temporada',
    genre: 'Acción / Drama',
    rating: 7.3,
    cast: ['Oscar Isaac', 'Ethan Hawke', 'May Calamawy', 'F. Murray Abraham'],
  ),
  Series(
    id: 10,
    title: 'Obi-Wan Kenobi',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/3/35/Obi-Wan_Kenobi_poster.jpg',
    description:
        'Ten years after the dramatic events of Revenge of the Sith, Obi-Wan Kenobi faces his greatest defeat — the corruption and the fall of his best friend Anakin Skywalker turned Sith Lord Darth Vader.',
    year: '2022',
    seasons: '1 Temporada',
    genre: 'Acción / Aventura',
    rating: 7.1,
    cast: [
      'Ewan McGregor',
      'Hayden Christensen',
      'Moses Ingram',
      'Joel Edgerton',
    ],
  ),
];

// ── Series Page ────────────────────────────────────────────────────────────────
class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  String _filter = '';

  List<Series> get _filtered => disneySeriesList
      .where((s) => s.title.toLowerCase().contains(_filter.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D0D1A),
      child: CustomScrollView(
        slivers: [
          // ── Header ──────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E90FF),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Series',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${_filtered.length} títulos',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Search bar
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: TextField(
                      onChanged: (v) => setState(() => _filter = v),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Buscar series...',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white.withOpacity(0.3),
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),

          // ── Grid ────────────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
                childAspectRatio: 0.58,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final series = _filtered[index];
                return _SeriesCard(
                  series: series,
                  onTap: () => _showDetail(context, series),
                );
              }, childCount: _filtered.length),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 48)),
        ],
      ),
    );
  }

  void _showDetail(BuildContext context, Series series) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (_) => _SeriesDetailDialog(series: series),
    );
  }
}

// ── Series Card ────────────────────────────────────────────────────────────────
class _SeriesCard extends StatefulWidget {
  final Series series;
  final VoidCallback onTap;

  const _SeriesCard({required this.series, required this.onTap});

  @override
  State<_SeriesCard> createState() => _SeriesCardState();
}

class _SeriesCardState extends State<_SeriesCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..translate(0.0, _hovered ? -6.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF1E90FF).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                // Poster image
                Positioned.fill(
                  child: Image.network(
                    widget.series.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF1A1A2E),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.tv_rounded,
                              color: Colors.white.withOpacity(0.3),
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                widget.series.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Gradient overlay
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _hovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.9),
                          ],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
                // Rating badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFC107),
                          size: 11,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          widget.series.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Hover info
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    opacity: _hovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.series.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${widget.series.year} · ${widget.series.seasons}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E90FF),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Ver detalles',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Detail Dialog ──────────────────────────────────────────────────────────────
class _SeriesDetailDialog extends StatelessWidget {
  final Series series;

  const _SeriesDetailDialog({required this.series});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 780, maxHeight: 520),
        decoration: BoxDecoration(
          color: const Color(0xFF12122A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Row(
          children: [
            // ── Poster ──────────────────────────────────────────────────
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
              child: SizedBox(
                width: 240,
                child: Image.network(
                  series.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFF1A1A2E),
                    child: Center(
                      child: Icon(
                        Icons.tv_rounded,
                        color: Colors.white.withOpacity(0.2),
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── Info ─────────────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Close button
 