import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0E0B14), 
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Iconos de Redes Sociales
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(Icons.close), 
              SizedBox(width: 25),
              _SocialIcon(Icons.facebook),
              SizedBox(width: 25),
              _SocialIcon(Icons.camera_alt_outlined), 
              SizedBox(width: 25),
              _SocialIcon(Icons.music_note), 
              SizedBox(width: 25),
              _SocialIcon(Icons.play_circle_outline), 
            ],
          ),
          const SizedBox(height: 20),

          // 2. Logo Central de Disney+
          SizedBox(
            height: 80,
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney%2B_logo.svg',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Disney%2B_logo.svg/1280px-Disney%2B_logo.svg.png',
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          const SizedBox(height: 30),

          // 3. Texto Legal
          const Text(
            '© 2026 Disney y su familia de compañías afiliadas. Todos los derechos reservados. Disney+ requiere una suscripción y ser mayor de 18 años. Contenidos sujetos a disponibilidad.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70, 
              fontSize: 12, 
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'El servicio Disney+ es comercializado por The Walt Disney Company Colombia S.A.S., Calle 70 Bis No. 4 – 41, Bogotá D.C., Colombia, y número de NIT 800.236.937-1.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70, 
              fontSize: 12, 
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      size: 26,
    );
  }
}