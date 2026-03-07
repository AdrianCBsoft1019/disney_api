// views/characters_page.dart (o donde guardes tus páginas)
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg2,
      appBar: AppBar(
        title: const Text(
          "PERSONAJES DISNEY+",
          style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 2),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // Para que el Hero suba hasta arriba
      body: SingleChildScrollView(
        // <-- Habilitamos scroll para toda la página
        child: Column(
          children: [
            // ============================================================
            // 1. HERO DE PROMOCIONES (Inspirado en Imagen 1/3)
            // ============================================================
            Container(
              height: 500, // Altura similar a tu carrusel
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // Imagen de fondo promocional de Disney
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1608044755073-66d4c3b3fe91?w=1200&h=600&fit=crop'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Degradado para legibilidad del texto
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  // Contenido: Texto y botón
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          'PRÓXIMAMENTE',
                          style: TextStyle(
                              color: AppColors.disney_blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'PERSONAJES DE DISNEY +',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Explora todos los personajes de Disney+ en una sola plataforma',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.disney_blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15)),
                          child: const Text('MÁS INFORMACIÓN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // ============================================================
            // 2. CUADRÍCULA DE PERSONAJES (Inspirado en Imagen 2)
            // ============================================================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                spacing: 20, // Espacio horizontal entre tarjetas
                runSpacing: 20, // Espacio vertical entre filas
              ),
            ),
            const SizedBox(height: 60), // Margen inferior
          ],
        ),
      ),
    );
  }
}
