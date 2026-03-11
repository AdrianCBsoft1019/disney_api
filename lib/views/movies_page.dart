import 'package:flutter/material.dart';
import 'movie_detail_page.dart';

// ── Movie model ────────────────────────────────────────────────────────────────
class _Movie {
  final String id;
  final String title;
  final String year;
  final String imageUrl;
  final String backdrop;
  final String description;
  final List<String> genres;
  final double rating;
  final String director;

  const _Movie({
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

  MovieDetailData toDetailData() => MovieDetailData(
        id: id, title: title, year: year,
        imageUrl: imageUrl, backdrop: backdrop,
        description: description, genres: genres,
        rating: rating, director: director,
      );
}

const _movies = [
  _Movie(
    id: '1', title: 'Frozen II', year: '2019',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNbm28EZhooHofMhqRbjqYXm58jMZo87-n1A&s',
    backdrop: 'https://los40.com/resizer/v2/GMVVEZP26VMD5JQXDYU3JL5MZQ.jpg?auth=4a012cab3376474029128855b4473d2a5d3044d1f2774325ab9bb4c864b45032&quality=70&width=1200&height=675&smart=true',
    description: 'Elsa, Anna, Kristoff, Olaf y Sven viajan más allá de Arendelle para descubrir el origen de los poderes de Elsa.',
    genres: ['Animación', 'Aventura', 'Familia'], rating: 7.2, director: 'Chris Buck',
  ),
  _Movie(
    id: '2', title: 'Encanto', year: '2021',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/encanto_ka_las_pay1_92ad7410.jpeg',
    backdrop: 'https://www.infobae.com/resizer/v2/TGR7MGNDXBHG3BOOTPWKEY6WRA.png?auth=2f23fc348ab5ef1e08d34e19739e45f64b3d732b95464375009d7b6d2ec896fa&smart=true&width=1024&height=512&quality=85',
    description: 'La historia de los Madrigal, una familia extraordinaria que vive en una casa mágica en las montañas de Colombia.',
    genres: ['Animación', 'Familia', 'Musical'], rating: 7.7, director: 'Byron Howard',
  ),
  _Movie(
    id: '3', title: 'Moana 2', year: '2024',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/p_moana_20530_214883e3.jpeg?region=0%2C0%2C540%2C810',
    backdrop: 'https://ichef.bbci.co.uk/images/ic/480xn/p04j6nxk.jpg.webp',
    description: 'Moana recibe un inesperado aviso de sus ancestros y se embarca en una nueva e increíble aventura.',
    genres: ['Animación', 'Aventura'], rating: 8.3, director: 'David G. Derrick Jr.',
  ),
  _Movie(
    id: '4', title: 'Avatar: El Sentido del Agua', year: '2022',
    imageUrl: 'https://http2.mlstatic.com/D_NQ_NP_820377-MLU70799697688_082023-O.webp',
    backdrop: 'https://media.gqmagazine.fr/photos/63dce1f582e384fe4d7ac7ef/master/pass/raw.jpeg',
    description: 'Jake Sully y Ney\'tiri han formado una familia en Pandora. Cuando una amenaza familiar regresa, Jake debe pelear una guerra difícil.',
    genres: ['Acción', 'Aventura', 'Ciencia Ficción'], rating: 7.6, director: 'James Cameron',
  ),
  _Movie(
    id: '5', title: 'Deadpool & Wolverine', year: '2024',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNYOexsRNcZp1Fr-ZGwBoUxOg6-29ALKpJmA&s',
    backdrop: 'https://lumiere-a.akamaihd.net/v1/images/mobile_89eef737.jpeg?region=0,0,1239,1001',
    description: 'Una misión que cambiará la historia del Universo Cinematográfico de Marvel para siempre.',
    genres: ['Acción', 'Comedia', 'Ciencia Ficción'], rating: 8.1, director: 'Shawn Levy',
  ),
  _Movie(
    id: '6', title: 'Elementos', year: '2023',
    imageUrl: 'https://purodiseno.lat/wp-content/uploads/2023/09/ELEMENTOS-POSTER-.jpg',
    backdrop: 'https://cadenaser.com/resizer/v2/6DOR626ASZGEDLHFVDOTP2EJT4.jpg?auth=fe54a80cc9512727e7d748ecf2217b5192cd875aef342b1b24f0b1ad4d902932',
    description: 'En una ciudad donde los cuatro elementos conviven, Fuego y Agua descubren algo que nunca imaginaron.',
    genres: ['Animación', 'Familia', 'Comedia'], rating: 7.7, director: 'Peter Sohn',
  ),
  _Movie(
    id: '7', title: 'Toy Story 4', year: '2019',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwDIjEoDK0n7sWZHGWJlrLqfq8v6OqWX_Wig&s',
    backdrop: 'https://lumiere-a.akamaihd.net/v1/images/toy-story-4-background_ab0c7920.jpeg',
    description: 'Woody y su pandilla emprenden una nueva aventura cuando Bonnie entra a la escuela.',
    genres: ['Animación', 'Aventura', 'Familia'], rating: 7.8, director: 'Josh Cooley',
  ),
  _Movie(
    id: '8', title: 'Coco', year: '2017',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/98/Coco_%282017_film%29_poster.jpg',
    backdrop: 'https://lumiere-a.akamaihd.net/v1/images/coco-background_3ab6c8d5.jpeg',
    description: 'Miguel persigue su pasión por la música en el colorido y mágico mundo de Coco.',
    genres: ['Animación', 'Aventura', 'Familia'], rating: 8.4, director: 'Lee Unkrich',
  ),
  _Movie(
    id: '9', title: 'Aladdin', year: '2019',
    imageUrl: 'https://m.media-amazon.com/images/M/MV5BMjQ2NjM5NjUyMV5BMl5BanBnXkFtZTgwMjE5NTQ2NjM@._V1_.jpg',
    backdrop: 'https://lumiere-a.akamaihd.net/v1/images/aladdin-background_c9b9c9d9.jpeg',
    description: 'Un joven ladrón descubre un poder mágico y se enamora de una princesa en el mágico Agrabah.',
    genres: ['Aventura', 'Acción', 'Familia'], rating: 7.0, director: 'Guy Ritchie',
  ),
  _Movie(
    id: '10', title: 'Raya y el Último Dragón', year: '2021',
    imageUrl: 'https://lumiere-a.akamaihd.net/v1/images/p_raya_23378_ebcd0b64.jpeg',
    backdrop: 'https://lumiere-a.akamaihd.net/v1/images/raya-background_b9b8c8d8.jpeg',
    description: 'Raya busca el último dragón para salvar su mundo del mal que amenaza con destruirlo todo.',
    genres: ['Animación', 'Aventura', 'Acción'], rating: 7.8, director: 'Don Hall',
  ),
];

// ── MoviesPage ─────────────────────────────────────────────────────────────────
class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  String _filter = '';

  List<_Movie> get _filtered => _movies
      .where((m) => m.title.toLowerCase().contains(_filter.toLowerCase()))
      .toList();

  void _openDetail(BuildContext context, _Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MovieDetailPage(movie: movie.toDetailData()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D0D1A),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: 4, height: 32,
                          decoration: BoxDecoration(color: const Color(0xFF1E90FF), borderRadius: BorderRadius.circular(2))),
                      const SizedBox(width: 12),
                      const Text('Películas',
                          style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                      const Spacer(),
                      Text('${_filtered.length} títulos',
                          style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 24),
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
                        hintText: 'Buscar películas...',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14),
                        prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.3), size: 20),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
                childAspectRatio: 0.58,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final movie = _filtered[index];
                  return _MovieCard(
                    movie: movie,
                    onTap: () => _openDetail(context, movie),
                  );
                },
                childCount: _filtered.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 48)),
        ],
      ),
    );
  }
}

// ── Movie Card ─────────────────────────────────────────────────────────────────
class _MovieCard extends StatefulWidget {
  final _Movie movie;
  final VoidCallback onTap;
  const _MovieCard({required this.movie, required this.onTap});

  @override
  State<_MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<_MovieCard> {
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
                ? [BoxShadow(color: const Color(0xFF1E90FF).withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 8))]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(widget.movie.imageUrl, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFF1A1A2E),
                        child: Center(child: Icon(Icons.movie_rounded, color: Colors.white.withOpacity(0.3), size: 40)),
                      )),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _hovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter, end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8, right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 11),
                        const SizedBox(width: 3),
                        Text(widget.movie.rating.toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: AnimatedOpacity(
                    opacity: _hovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(widget.movie.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 4),
                          Text('${widget.movie.year} · ${widget.movie.director}',
                              style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10)),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(color: const Color(0xFF1E90FF), borderRadius: BorderRadius.circular(4)),
                            child: const Text('Ver detalles',
                                style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
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