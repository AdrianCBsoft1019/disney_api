import 'package:flutter/material.dart';

// ── Movie model (reutiliza la misma estructura de movies_page) ─────────────────
class MovieDetailData {
  final String id;
  final String title;
  final String year;
  final String imageUrl;
  final String backdrop;
  final String description;
  final List<String> genres;
  final double rating;
  final String director;

  const MovieDetailData({
    required this.id,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.backdrop,
    required this.description,
    required this.genres,
    required this.rating,
    required this.director,
  });
}

// ── Movie Detail Page ──────────────────────────────────────────────────────────
// Se llama con Navigator.push o showDialog desde movies_page / carousel
class MovieDetailPage extends StatelessWidget {
  final MovieDetailData movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Backdrop hero ────────────────────────────────────────────
            _BackdropHero(movie: movie),

            // ── Content below backdrop ───────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Genres row
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: movie.genres
                        .map((g) => _GenreChip(g))
                        .toList(),
                  ),
                  const SizedBox(height: 24),

                  // Description section
                  Text(
                    'Sinopsis',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    movie.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Details grid
                  _DetailsGrid(movie: movie),
                  const SizedBox(height: 36),

                  // Actions
                  Row(
                    children: [
                      // Ver ahora
                      _ActionButton(
                        label: 'Ver ahora',
                        icon: Icons.play_arrow_rounded,
                        primary: true,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      // Add to list
                      _ActionButton(
                        label: 'Mi lista',
                        icon: Icons.add_rounded,
                        primary: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Backdrop Hero ──────────────────────────────────────────────────────────────
class _BackdropHero extends StatelessWidget {
  final MovieDetailData movie;
  const _BackdropHero({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Backdrop image
          Image.network(
            movie.backdrop.isNotEmpty ? movie.backdrop : movie.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF1A1A2E)),
          ),
          // Dark overlays
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black.withOpacity(0.85), Colors.transparent],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, const Color(0xFF0D0D1A)],
                stops: const [0.55, 1.0],
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 24,
            left: 24,
            child: GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                ),
                child: const Icon(Icons.arrow_back_rounded,
                    color: Colors.white, size: 20),
              ),
            ),
          ),

          // Info overlay (left side)
          Positioned(
            left: 40,
            bottom: 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 10),
                // Meta info row
                Row(
                  children: [
                    _MetaBadge(movie.year, const Color(0xFF1E90FF)),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Color(0xFFFFC107), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${movie.rating}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    _MetaBadge('Dir. ${movie.director}', const Color(0xFF6C63FF)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Details Grid ───────────────────────────────────────────────────────────────
class _DetailsGrid extends StatelessWidget {
  final MovieDetailData movie;
  const _DetailsGrid({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          _DetailItem(label: 'Director', value: movie.director),
          _DetailDivider(),
          _DetailItem(label: 'Año', value: movie.year),
          _DetailDivider(),
          _DetailItem(label: 'Géneros', value: movie.genres.join(', ')),
          _DetailDivider(),
          _DetailItem(label: 'Calificación', value: '${movie.rating} / 10'),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.35),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              )),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}

class _DetailDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white.withOpacity(0.1),
    );
  }
}

// ── Action Button ──────────────────────────────────────────────────────────────
class _ActionButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool primary;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.primary,
    required this.onTap,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
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
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: widget.primary
                ? (_hovered
                    ? const Color(0xFF1565C0)
                    : const Color(0xFF1E90FF))
                : (_hovered
                    ? Colors.white.withOpacity(0.15)
                    : Colors.white.withOpacity(0.08)),
            borderRadius: BorderRadius.circular(10),
            border: widget.primary
                ? null
                : Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: widget.primary && _hovered
                ? [BoxShadow(color: const Color(0xFF1E90FF).withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 6))]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Helper widgets ─────────────────────────────────────────────────────────────
class _GenreChip extends StatelessWidget {
  final String label;
  const _GenreChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E90FF).withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1E90FF).withOpacity(0.3)),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Color(0xFF1E90FF), fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}

class _MetaBadge extends StatelessWidget {
  final String text;
  final Color color;
  const _MetaBadge(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Text(text,
          style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}