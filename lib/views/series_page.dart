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

const List<Series> disneySeriesList = [
  Series(
    id: 1,
    title: 'The Mandalorian',
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BNjgxZGM0OWUtZGY1MS00MWRmLTk2N2ItYjQyZTI1OThlZDliXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    description:
        'Tras la caída del Imperio, un solitario pistolero recorre los confines más remotos de la galaxia sin ley. Ambientada en el universo de Star Wars, la serie sigue a un misterioso cazarrecompensas que debe proteger a un valioso pupilo de quienes lo persiguen.',
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
        'https://m.media-amazon.com/images/M/MV5BZTMxMmM1ODItMTZiMS00NjI1LWEwODctMjQ4ZjY4ODliNDI0XkEyXkFqcGc@._V1_QL75_UX190_CR0,2,190,281_.jpg',
    description:
        'Wanda Maximoff y Visión, dos seres con superpoderes que viven una vida suburbana aparentemente perfecta, comienzan a sospechar que nada es lo que parece. Una mezcla única de comedia de situación clásica con el universo cinematográfico de Marvel.',
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
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP1EsBRT-TQ7BTfzbn0EXJ9MGz6V5nC5W-Hw&s',
    description:
        'El escurridizo villano Loki retoma su papel como Dios de las Travesuras en una nueva aventura que transcurre tras los eventos de Avengers: Endgame. Obligado a colaborar con la Autoridad de Variación Temporal, deberá enfrentar versiones alternativas de sí mismo.',
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
        'https://m.media-amazon.com/images/M/MV5BNGI2MTJjMjUtMTJhOC00YTY2LTg1NjUtMTdmMjg4YTk2YjM5XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    description:
        'Es un thriller de espionaje y drama político que muestra cómo nació la Rebelión desde las sombras.',
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
        'https://m.media-amazon.com/images/M/MV5BYjA2MzUyY2EtMTBmZC00MmNmLWFkNTMtMjlhY2M2ZTMzNzY0XkEyXkFqcGc@._V1_.jpg',
    description:
        'La serie sigue su lucha por transformar un negocio caótico y endeudado, mientras lidia con un personal resistente al cambio y su propio duelo',
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
        'https://m.media-amazon.com/images/M/MV5BOGU5ZDBlOTAtOTZmYS00MWE0LTg0NzktNDcxZGJhN2FhZmM2XkEyXkFqcGc@._V1_.jpg',
    description:
        'Tras los eventos de Avengers: Endgame, Clint Barton debe asociarse con la joven arquera Kate Bishop para enfrentar enemigos de su pasado. Todo esto mientras intenta llegar a casa a tiempo para pasar la Navidad con su familia.',
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
        'https://m.media-amazon.com/images/M/MV5BNmYzYzA2NzMtOTVmMC00ZDY4LThlMDctZmUyN2NlMjQ2ODViXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    description:
        'Nick Fury y Talos descubren que una facción de Skrulls cambia-formas ha estado infiltrándose en la Tierra durante años, ocultándose a plena vista en los niveles más altos de los gobiernos y las sociedades del mundo.',
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
        'https://m.media-amazon.com/images/M/MV5BYzkxYjcxOWUtNWM5Zi00MzY3LTliYjAtNGYyNjE5OWY2MmU4XkEyXkFqcGc@._V1_.jpg',
    description:
        'la adición más reciente al universo de Star Wars y ha generado mucha conversación por explorar una época que nunca habíamos visto en acción real',
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
        'https://m.media-amazon.com/images/M/MV5BNDAzNmYwZjgtNDc3YS00ZDMyLTk0MjktMTg4MGNmNGU3MjlhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    description:
        'Un mercenario con trastorno de identidad disociativa se ve envuelto en un misterio mortal relacionado con los dioses egipcios. Mientras tanto, su alter ego, un tímido empleado de tienda de museo, también lucha por sobrevivir.',
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
        'https://m.media-amazon.com/images/M/MV5BOGU4ODlmNmMtMDM0OS00NTMxLWFlODUtZGFkMjU5NDdhMjgyXkEyXkFqcGc@._V1_.jpg',
    description:
        'Diez años después de los dramáticos eventos de La Venganza de los Sith, Obi-Wan Kenobi enfrenta su mayor derrota: la corrupción y caída de su mejor amigo Anakin Skywalker, convertido en el Señor Sith Darth Vader.',
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
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white.withOpacity(0.6),
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Title
                    Text(
                      series.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Meta badges
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _Badge(series.year, const Color(0xFF1E90FF)),
                        _Badge(series.seasons, const Color(0xFF6C63FF)),
                        _Badge(series.genre, const Color(0xFF00C896)),
                        _Badge('⭐ ${series.rating}', const Color(0xFFFFC107)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Divider
                    Divider(color: Colors.white.withOpacity(0.08)),
                    const SizedBox(height: 12),
                    // Description
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          series.description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 13.5,
                            height: 1.65,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Cast
                    Text(
                      'REPARTO PRINCIPAL',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.35),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: series.cast
                          .map(
                            (name) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                              child: Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    // CTA
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow_rounded, size: 20),
                        label: const Text(
                          'Reproducir',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E90FF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
