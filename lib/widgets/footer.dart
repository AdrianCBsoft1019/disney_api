import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBg2,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
      child: Column(
        children: [
          // Top row: logo + links
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              SizedBox(
                width: 90,
                height: 40,
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney%2B_logo.svg',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Text(
                    'Disney+',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 60),
              // Links
              Expanded(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 16,
                  children: [
                    _FooterColumn(title: 'Contenido', links: [
                      'Películas',
                      'Series',
                      'Originales',
                      'Personajes',
                    ]),
                    _FooterColumn(title: 'Cuenta', links: [
                      'Suscribirse',
                      'Mi perfil',
                      'Configuración',
                    ]),
                    _FooterColumn(title: 'Soporte', links: [
                      'Centro de ayuda',
                      'Términos de uso',
                      'Política de privacidad',
                    ]),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Divider(color: Colors.white.withOpacity(0.1)),
          const SizedBox(height: 16),
          // Bottom row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2025 Disney+. Todos los derechos reservados.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.35),
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  _SocialIcon(Icons.facebook_rounded),
                  const SizedBox(width: 12),
                  _SocialIcon(Icons.camera_alt_outlined),
                  const SizedBox(width: 12),
                  _SocialIcon(Icons.alternate_email),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> links;

  const _FooterColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: AppColors.disney_blue,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                link,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  fontSize: 13,
                ),
              ),
            )),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  const _SocialIcon(this.icon);

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.disney_blue.withOpacity(0.2)
              : Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _hovered
                ? AppColors.disney_blue.withOpacity(0.5)
                : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Icon(widget.icon,
            color: _hovered ? AppColors.disney_blue : Colors.white.withOpacity(0.5),
            size: 16),
      ),
    );
  }
}