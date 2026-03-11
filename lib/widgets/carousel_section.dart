import 'package:flutter/material.dart';

class _Release {
  final String title;
  final String year;
  final String tag;
  final String imageUrl;
  final double rating;

  const _Release({
    required this.title,
    required this.year,
    required this.tag,
    required this.imageUrl,
    required this.rating,
  });
}

const _releases = [
  _Release(
    title: 'Avatar: El Sentido del Agua',
    year: '2022',
    tag: 'PELÍCULA • SCI-FI',
    imageUrl: 'https://media.gqmagazine.fr/photos/63dce1f582e384fe4d7ac7ef/master/pass/raw.jpeg',
    rating: 7.6,
  ),
  _Release(
    title: 'Shogun',
    year: '2024',
    tag: 'SERIE • DRAMA',
    imageUrl: 'https://hips.hearstapps.com/hmg-prod/images/shogun-105-04461r-65f89ad62c488.jpg',
    rating: 8.8,
  ),
  _Release(
    title: 'Deadpool & Wolverine',
    year: '2024',
    tag: 'PELÍCULA • ACCIÓN',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/mobile_89eef737.jpeg?region=0,0,1239,1001',
    rating: 8.1,
  ),
  _Release(
    title: 'Moana 2',
    year: '2024',
    tag: 'PELÍCULA • ANIMACIÓN',
    imageUrl: 'https://ichef.bbci.co.uk/images/ic/480xn/p04j6nxk.jpg.webp',
    rating: 8.3,
  ),
  _Release(
    title: 'The Acolyte',
    year: '2024',
    tag: 'SERIE • SCI-FI',
    imageUrl: 'https://m.media-amazon.com/images/M/MV5BYzkxYjcxOWUtNWM5Zi00MzY3LTliYjAtNGYyNjE5OWY2MmU4XkEyXkFqcGc@._V1_.jpg',
    rating: 6.5,
  ),
  _Release(
    title: 'Ahsoka',
    year: '2023',
    tag: 'SERIE • AVENTURA',
    imageUrl: 'https://es.web.img2.acsta.net/pictures/23/09/19/11/27/3320024.jpg',
    rating: 7.8,
  ),
];

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  int _current = 0;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _prev() {
    if (_current > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void _next() {
    if (_current < _releases.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D0D1A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section label
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Estrenos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                // Counter
                Text(
                  '${_current + 1} / ${_releases.length}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Carousel with arrows
          SizedBox(
            height: 380,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _controller,
                  itemCount: _releases.length,
                  onPageChanged: (i) => setState(() => _current = i),
                  itemBuilder: (_, i) => _ReleaseSlide(release: _releases[i]),
                ),

                // Left arrow
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _ArrowBtn(
                      icon: Icons.chevron_left_rounded,
                      onTap: _prev,
                      enabled: _current > 0,
                    ),
                  ),
                ),

                // Right arrow
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _ArrowBtn(
                      icon: Icons.chevron_right_rounded,
                      onTap: _next,
                      enabled: _current < _releases.length - 1,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Dot indicators
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _releases.length,
                (i) => GestureDetector(
                  onTap: () => _controller.animateToPage(i,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _current == i ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _current == i
                          ? const Color(0xFFFFD700)
                          : Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Release Slide ──────────────────────────────────────────────────────────────
class _ReleaseSlide extends StatelessWidget {
  final _Release release;
  const _ReleaseSlide({required this.release});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.network(
          release.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
              Container(color: const Color(0xFF1A1A2E)),
        ),
        // Overlay gradients
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.75),
              ],
            ),
          ),
        ),
        // Center content
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tag
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: const Color(0xFFFFD700).withOpacity(0.4)),
                ),
                child: Text(
                  release.tag,
                  style: const TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                release.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              // Year + rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    release.year,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 13),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.star_rounded,
                      color: Color(0xFFFFC107), size: 14),
                  const SizedBox(width: 4),
                  Text(
                    '${release.rating}',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // "Ver ahora" button
              GestureDetector(
                onTap: () {}, // sin función por ahora
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E90FF),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1E90FF).withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow_rounded,
                          color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Ver ahora',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Arrow Button ───────────────────────────────────────────────────────────────
class _ArrowBtn extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;

  const _ArrowBtn(
      {required this.icon, required this.onTap, required this.enabled});

  @override
  State<_ArrowBtn> createState() => _ArrowBtnState();
}

class _ArrowBtnState extends State<_ArrowBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.enabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.enabled
                ? (_hovered
                    ? const Color(0xFF1E90FF).withOpacity(0.8)
                    : Colors.black.withOpacity(0.55))
                : Colors.black.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.enabled
                  ? Colors.white.withOpacity(0.3)
                  : Colors.white.withOpacity(0.1),
            ),
          ),
          child: Icon(
            widget.icon,
            color: widget.enabled
                ? Colors.white
                : Colors.white.withOpacity(0.3),
            size: 28,
          ),
        ),
      ),
    );
  }
}