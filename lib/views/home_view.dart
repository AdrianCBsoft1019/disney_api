import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/carousel_section.dart';

class _FeaturedItem {
  final String title;
  final String subtitle;
  final String tag;
  final String imageUrl;
  final double rating;

  const _FeaturedItem({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.imageUrl,
    required this.rating,
  });
}

const _featured = [
  _FeaturedItem(
    title: 'Shogun',
    subtitle: 'En el Japón de 1600, Lord Toranaga lucha por su vida contra poderosos enemigos.',
    tag: 'SERIE • DRAMA',
    imageUrl: 'https://hips.hearstapps.com/hmg-prod/images/shogun-105-04461r-65f89ad62c488.jpg',
    rating: 8.8,
  ),
  _FeaturedItem(
    title: 'Deadpool & Wolverine',
    subtitle: 'Una misión que cambiará la historia del Universo Cinematográfico de Marvel.',
    tag: 'PELÍCULA • ACCIÓN',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/mobile_89eef737.jpeg?region=0,0,1239,1001',
    rating: 8.1,
  ),
  _FeaturedItem(
    title: 'The Bear',
    subtitle: 'Un joven chef regresa a Chicago para dirigir la tienda caótica de su familia.',
    tag: 'SERIE • DRAMA',
    imageUrl: 'https://es.web.img3.acsta.net/pictures/22/06/10/16/53/5259982.jpg',
    rating: 8.6,
  ),
  _FeaturedItem(
    title: 'Moana 2',
    subtitle: 'Moana recibe un inesperado aviso de sus ancestros y emprende una nueva aventura.',
    tag: 'PELÍCULA • ANIMACIÓN',
    imageUrl: 'https://ichef.bbci.co.uk/images/ic/480xn/p04j6nxk.jpg.webp',
    rating: 8.3,
  ),
];

class _SmallCard {
  final String title;
  final String year;
  final String imageUrl;
  final double rating;
  const _SmallCard({required this.title, required this.year, required this.imageUrl, required this.rating});
}

const _smallCards = [
  _SmallCard(title: 'Frozen II', year: '2019', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNbm28EZhooHofMhqRbjqYXm58jMZo87-n1A&s', rating: 7.2),
  _SmallCard(title: 'Encanto', year: '2021', imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/encanto_ka_las_pay1_92ad7410.jpeg', rating: 7.7),
  _SmallCard(title: 'Loki', year: '2021', imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDU0MTQ0YWQtMmM0Yy00Y2FmLWI5OTktZWM1ODg5MGY4OTQ4XkEyXkFqcGc@._V1_QL75_UY281_CR18,0,190,281_.jpg', rating: 8.2),
  _SmallCard(title: 'Andor', year: '2022', imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/andor_poster_eb4ef19e.jpeg', rating: 8.4),
  _SmallCard(title: 'Coco', year: '2017', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/98/Coco_%282017_film%29_poster.jpg', rating: 8.4),
  _SmallCard(title: 'Toy Story 4', year: '2019', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwDIjEoDK0n7sWZHGWJlrLqfq8v6OqWX_Wig&s', rating: 7.8),
  _SmallCard(title: 'Elementos', year: '2023', imageUrl: 'https://purodiseno.lat/wp-content/uploads/2023/09/ELEMENTOS-POSTER-.jpg', rating: 7.7),
  _SmallCard(title: 'Mandalorian', year: '2019', imageUrl: 'https://m.media-amazon.com/images/M/MV5BNjgxZGM0OWUtZGY1MS00MWRmLTk2N2ItYjQyZTI1OThlZDliXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', rating: 8.7),
];

// ── HomeView ───────────────────────────────────────────────────────────────────
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _current = 0;
  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      final next = (_current + 1) % _featured.length;
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView para que todo el Home sea desplazable verticalmente
    return Container(
      color: const Color(0xFF0D0D1A),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Carousel (altura fija, funciona dentro del scroll) ──────
            SizedBox(
              height: 460,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _featured.length,
                    onPageChanged: (i) => setState(() => _current = i),
                    itemBuilder: (_, i) => _HeroSlide(item: _featured[i]),
                  ),
                  Positioned(
                    bottom: 20, left: 0, right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_featured.length, (i) =>
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _current == i ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _current == i
                                ? const Color(0xFF1E90FF)
                                : Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Destacados de la semana ──────────────────────────────────────
            const Padding(
              padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: _SectionLabel('Destacados de la semana'),
            ),
            // ListView horizontal con altura fija — no necesita NeverScrollableScrollPhysics
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                itemCount: _smallCards.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) => _SmallMovieCard(card: _smallCards[i]),
              ),
            ),

            // ── Estrenos carousel ────────────────────────────────────────────
            const SizedBox(height: 8),
            const CarouselSection(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── Hero Slide ─────────────────────────────────────────────────────────────────
class _HeroSlide extends StatelessWidget {
  final _FeaturedItem item;
  const _HeroSlide({required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(item.imageUrl, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: const Color(0xFF1A1A2E))),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight, end: Alignment.centerLeft,
              colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
              colors: [Colors.transparent, const Color(0xFF0D0D1A)],
              stops: const [0.6, 1.0],
            ),
          ),
        ),
        Positioned(
          left: 48, bottom: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E90FF).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF1E90FF).withOpacity(0.4)),
                ),
                child: Text(item.tag,
                    style: const TextStyle(color: Color(0xFF1E90FF), fontSize: 11,
                        fontWeight: FontWeight.w700, letterSpacing: 1)),
              ),
              const SizedBox(height: 12),
              Text(item.title,
                  style: const TextStyle(color: Colors.white, fontSize: 38,
                      fontWeight: FontWeight.w800, letterSpacing: -0.5)),
              const SizedBox(height: 8),
              SizedBox(
                width: 380,
                child: Text(item.subtitle,
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14, height: 1.5)),
              ),
              const SizedBox(height: 6),
              Row(children: [
                const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 16),
                const SizedBox(width: 4),
                Text('${item.rating}',
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Small Movie Card ───────────────────────────────────────────────────────────
class _SmallMovieCard extends StatefulWidget {
  final _SmallCard card;
  const _SmallMovieCard({required this.card});

  @override
  State<_SmallMovieCard> createState() => _SmallMovieCardState();
}

class _SmallMovieCardState extends State<_SmallMovieCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(0.0, _hovered ? -4.0 : 0.0),
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: _hovered
              ? [BoxShadow(color: const Color(0xFF1E90FF).withOpacity(0.35),
                  blurRadius: 16, offset: const Offset(0, 6))]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(widget.card.imageUrl, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: const Color(0xFF1A1A2E))),
              Positioned(
                bottom: 0, left: 0, right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter, end: Alignment.topCenter,
                      colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.card.title, maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontSize: 11,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 2),
                      Row(children: [
                        const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 10),
                        const SizedBox(width: 3),
                        Text('${widget.card.rating}',
                            style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10)),
                      ]),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 6, right: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.65),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(widget.card.year,
                      style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 9)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 20,
            decoration: BoxDecoration(color: const Color(0xFF1E90FF),
                borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 18,
            fontWeight: FontWeight.w700)),
      ],
    );
  }
}