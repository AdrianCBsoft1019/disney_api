import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../services/api_service.dart';
import '../widgets/footer.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  List<DisneyCharacter> _characters = [];
  bool _loading = true;
  bool _loadingMore = false;
  String? _error;
  int _currentPage = 1;
  int _totalPages = 1;
  int _totalCount = 0;

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;
  List<DisneyCharacter> _searchResults = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadCharacters();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        !_loadingMore &&
        _currentPage < _totalPages &&
        !_isSearching) {
      _loadMore();
    }
  }

  Future<void> _loadCharacters() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await ApiService.getCharacters(page: 1, pageSize: 50);
      setState(() {
        _characters = result['characters'] as List<DisneyCharacter>;
        _totalPages = result['totalPages'] as int;
        _totalCount = result['count'] as int;
        _currentPage = 1;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'No se pudo conectar con la API de Disney';
        _loading = false;
      });
    }
  }

  Future<void> _loadMore() async {
    if (_loadingMore || _currentPage >= _totalPages) return;
    setState(() => _loadingMore = true);
    try {
      final result =
          await ApiService.getCharacters(page: _currentPage + 1, pageSize: 50);
      setState(() {
        _characters.addAll(result['characters'] as List<DisneyCharacter>);
        _currentPage++;
        _loadingMore = false;
      });
    } catch (e) {
      setState(() => _loadingMore = false);
    }
  }

  Future<void> _search(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _isSearching = false;
        _searchQuery = '';
        _searchResults = [];
      });
      return;
    }
    setState(() {
      _isSearching = true;
      _searchQuery = query;
      _loading = true;
    });
    try {
      final results = await ApiService.searchCharacter(query);
      setState(() {
        _searchResults = results;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  List<DisneyCharacter> get _displayList =>
      _isSearching ? _searchResults : _characters;

  @override
  Widget build(BuildContext context) {
    // ── Casos especiales: loading / error / sin resultados ─────────────────
    if (_loading) {
      return Container(
        color: const Color(0xFF0D0D1A),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Color(0xFF1E90FF)),
              SizedBox(height: 16),
              Text('Cargando personajes de Disney...',
                  style: TextStyle(color: Colors.white54, fontSize: 14)),
            ],
          ),
        ),
      );
    }

    if (_error != null) {
      return Container(
        color: const Color(0xFF0D0D1A),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off_rounded, color: Colors.white24, size: 56),
              const SizedBox(height: 16),
              Text(_error!,
                  style:
                      const TextStyle(color: Colors.white70, fontSize: 16)),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _loadCharacters,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Reintentar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E90FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // ── Layout principal: CustomScrollView (igual que SeriesPage) ──────────
    // Esto soluciona el problema de scroll: el header va como SliverToBoxAdapter
    // y el grid va como SliverGrid, todo en un solo scroll coordinado.
    return Container(
      color: const Color(0xFF0D0D1A),
      child: CustomScrollView(
        controller: _scrollController,
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
                        'Personajes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00C896).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: const Color(0xFF00C896).withOpacity(0.4)),
                        ),
                        child: const Text(
                          'Disney API',
                          style: TextStyle(
                            color: Color(0xFF00C896),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _isSearching
                            ? '${_searchResults.length} resultados'
                            : '${_characters.length} de $_totalCount personajes',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search bar
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) {
                        if (v.isEmpty) {
                          setState(() {
                            _isSearching = false;
                            _searchQuery = '';
                            _searchResults = [];
                          });
                        }
                      },
                      onSubmitted: _search,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Buscar personaje... (presiona Enter)',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 14),
                        prefixIcon: Icon(Icons.search,
                            color: Colors.white.withOpacity(0.3), size: 20),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                  setState(() {
                                    _isSearching = false;
                                    _searchQuery = '';
                                    _searchResults = [];
                                  });
                                },
                                child: Icon(Icons.close,
                                    color: Colors.white.withOpacity(0.3),
                                    size: 18),
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),

          // ── Sin resultados ───────────────────────────────────────────────
          if (_displayList.isEmpty)
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_search,
                          color: Colors.white24, size: 56),
                      const SizedBox(height: 12),
                      Text(
                        _isSearching
                            ? 'No se encontró "$_searchQuery"'
                            : 'Sin personajes',
                        style: const TextStyle(
                            color: Colors.white38, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // ── Grid de personajes ───────────────────────────────────────────
          if (_displayList.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              sliver: SliverGrid(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Indicador de carga al final
                    if (index == _displayList.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(
                              color: Color(0xFF1E90FF), strokeWidth: 2),
                        ),
                      );
                    }
                    final character = _displayList[index];
                    return _CharacterCard(
                      character: character,
                      onTap: () => _showDetail(context, character),
                    );
                  },
                  childCount: _displayList.length + (_loadingMore ? 1 : 0),
                ),
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }

  void _showDetail(BuildContext context, DisneyCharacter character) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (_) => _CharacterDetailDialog(character: character),
    );
  }
}

// ── Character Card ─────────────────────────────────────────────────────────────
class _CharacterCard extends StatefulWidget {
  final DisneyCharacter character;
  final VoidCallback onTap;

  const _CharacterCard({required this.character, required this.onTap});

  @override
  State<_CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<_CharacterCard> {
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
          transform: Matrix4.identity()
            ..translate(0.0, _hovered ? -6.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF1E90FF).withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Positioned.fill(
                  child: widget.character.imageUrl.isNotEmpty
                      ? Image.network(
                          widget.character.imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              color: const Color(0xFF1A1A2E),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: progress.expectedTotalBytes != null
                                      ? progress.cumulativeBytesLoaded /
                                          progress.expectedTotalBytes!
                                      : null,
                                  color: const Color(0xFF1E90FF),
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (_, __, ___) =>
                              _NoImagePlaceholder(name: widget.character.name),
                        )
                      : _NoImagePlaceholder(name: widget.character.name),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Color(0xCC000000),
                        ],
                        stops: [0.0, 0.55, 1.0],
                      ),
                    ),
                  ),
                ),
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
                            const Color(0xFF1E90FF).withOpacity(0.15),
                            Colors.black.withOpacity(0.85),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.character.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            shadows: [
                              Shadow(blurRadius: 8, color: Colors.black)
                            ],
                          ),
                        ),
                        if (widget.character.movieTitle.isNotEmpty &&
                            widget.character.movieTitle !=
                                'Universo Disney') ...[
                          const SizedBox(height: 3),
                          Text(
                            widget.character.movieTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 10,
                              shadows: const [
                                Shadow(blurRadius: 6, color: Colors.black)
                              ],
                            ),
                          ),
                        ],
                        AnimatedOpacity(
                          opacity: _hovered ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E90FF),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Ver detalles',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
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
        ),
      ),
    );
  }
}

// ── Placeholder sin imagen ─────────────────────────────────────────────────────
class _NoImagePlaceholder extends StatelessWidget {
  final String name;
  const _NoImagePlaceholder({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A2E),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_rounded,
                color: Colors.white.withOpacity(0.2), size: 40),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.4), fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Detail Dialog ──────────────────────────────────────────────────────────────
class _CharacterDetailDialog extends StatelessWidget {
  final DisneyCharacter character;
  const _CharacterDetailDialog({required this.character});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800, maxHeight: 560),
        decoration: BoxDecoration(
          color: const Color(0xFF12122A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(16)),
              child: SizedBox(
                width: 260,
                child: character.imageUrl.isNotEmpty
                    ? Image.network(character.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            _NoImagePlaceholder(name: character.name))
                    : _NoImagePlaceholder(name: character.name),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          child: Icon(Icons.close,
                              color: Colors.white.withOpacity(0.6), size: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      character.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Divider(color: Colors.white.withOpacity(0.08)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (character.films.isNotEmpty) ...[
                              _SectionTitle('🎬 Películas'),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 6, runSpacing: 6,
                                children: character.films
                                    .map((f) => _Tag(f, const Color(0xFF1E90FF)))
                                    .toList(),
                              ),
                              const SizedBox(height: 16),
                            ],
                            if (character.tvShows.isNotEmpty) ...[
                              _SectionTitle('📺 Series de TV'),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 6, runSpacing: 6,
                                children: character.tvShows
                                    .map((s) => _Tag(s, const Color(0xFF6C63FF)))
                                    .toList(),
                              ),
                              const SizedBox(height: 16),
                            ],
                            if (character.allies.isNotEmpty) ...[
                              _SectionTitle(' Aliados'),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 6, runSpacing: 6,
                                children: character.allies
                                    .map((a) => _Tag(a, const Color(0xFF00C896)))
                                    .toList(),
                              ),
                              const SizedBox(height: 16),
                            ],
                            if (character.enemies.isNotEmpty) ...[
                              _SectionTitle('⚔️ Enemigos'),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 6, runSpacing: 6,
                                children: character.enemies
                                    .map((e) => _Tag(e, const Color(0xFFFF6B6B)))
                                    .toList(),
                              ),
                              const SizedBox(height: 16),
                            ],
                            if (character.films.isEmpty &&
                                character.tvShows.isEmpty &&
                                character.allies.isEmpty &&
                                character.enemies.isEmpty)
                              Text(
                                'Personaje del universo Disney.',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                    height: 1.6),
                              ),
                          ],
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

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.4),
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color color;
  const _Tag(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}