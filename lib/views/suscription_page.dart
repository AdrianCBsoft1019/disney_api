import 'package:flutter/material.dart';
import '../widgets/footer.dart';

class SuscripcionPage extends StatefulWidget {
  const SuscripcionPage({super.key});

  @override
  State<SuscripcionPage> createState() => _SuscripcionPageState();
}

class _SuscripcionPageState extends State<SuscripcionPage> {
  int _selectedPlan = 1; // 0 = Básico, 1 = Estándar (destacado), 2 = Premium

  final List<_Plan> _plans = const [
    _Plan(
      id: 0,
      name: 'Básico',
      price: '4.99',
      period: 'mes',
      color: Color(0xFF4A90D9),
      icon: Icons.star_outline_rounded,
      description: 'Ideal para comenzar tu experiencia Disney+',
      features: [
        _Feature('Resolución HD (720p)', true),
        _Feature('1 pantalla simultánea', true),
        _Feature('Contenido Disney, Pixar y Star Wars', true),
        _Feature('Descargas para ver sin internet', false),
        _Feature('Contenido Marvel completo', false),
        _Feature('National Geographic', false),
        _Feature('Perfiles personalizados', true),
      ],
    ),
    _Plan(
      id: 1,
      name: 'Estándar',
      price: '8.99',
      period: 'mes',
      color: Color(0xFF1E90FF),
      icon: Icons.star_half_rounded,
      description: 'La experiencia completa para toda la familia',
      features: [
        _Feature('Resolución Full HD (1080p)', true),
        _Feature('2 pantallas simultáneas', true),
        _Feature('Contenido Disney, Pixar y Star Wars', true),
        _Feature('Descargas para ver sin internet', true),
        _Feature('Contenido Marvel completo', true),
        _Feature('National Geographic', true),
        _Feature('Perfiles personalizados', true),
      ],
    ),
    _Plan(
      id: 2,
      name: 'Premium',
      price: '13.99',
      period: 'mes',
      color: Color(0xFF6C63FF),
      icon: Icons.star_rounded,
      description: 'La mejor calidad para los más exigentes',
      features: [
        _Feature('Resolución 4K Ultra HD + HDR', true),
        _Feature('4 pantallas simultáneas', true),
        _Feature('Contenido Disney, Pixar y Star Wars', true),
        _Feature('Descargas ilimitadas', true),
        _Feature('Contenido Marvel completo', true),
        _Feature('National Geographic', true),
        _Feature('Perfiles personalizados ilimitados', true),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D0D1A),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ── Hero header ───────────────────────────────────────────────
            Stack(
              children: [
                // Background gradient glow
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(0, -0.5),
                        radius: 1.2,
                        colors: [
                          Color(0x331E90FF),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 52, 32, 40),
                  child: Column(
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E90FF).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xFF1E90FF).withOpacity(0.3)),
                        ),
                        child: const Text(
                          '✦  PLANES DE SUSCRIPCIÓN  ✦',
                          style: TextStyle(
                            color: Color(0xFF1E90FF),
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Elige tu plan\nDisney+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Accede a miles de películas, series y documentales.\nCancela cuando quieras.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ── Plans row ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _plans.map((plan) {
                  final isSelected = _selectedPlan == plan.id;
                  final isPopular = plan.id == 1;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: plan.id == 0 ? 0 : 12,
                        right: plan.id == 2 ? 0 : 12,
                        top: isPopular ? 0 : 24,
                      ),
                      child: _PlanCard(
                        plan: plan,
                        isSelected: isSelected,
                        isPopular: isPopular,
                        onTap: () => setState(() => _selectedPlan = plan.id),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 40),

            // ── CTA Button ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showConfirmDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _plans[_selectedPlan].color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                      ),
                      child: Text(
                        'Suscribirse al plan ${_plans[_selectedPlan].name} — \$${_plans[_selectedPlan].price}/mes',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Sin permanencia. Cancela en cualquier momento.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48),

            // ── Feature comparison table ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: _ComparisonTable(plans: _plans),
            ),

            const SizedBox(height: 60),
            const Footer(),
          ],
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    final plan = _plans[_selectedPlan];
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color(0xFF12122A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: plan.color.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: plan.color.withOpacity(0.2),
                blurRadius: 40,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: plan.color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(plan.icon, color: plan.color, size: 30),
              ),
              const SizedBox(height: 20),
              Text(
                'Plan ${plan.name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$${plan.price}',
                      style: TextStyle(
                        color: plan.color,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: '/${plan.period}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.white.withOpacity(0.08)),
              const SizedBox(height: 16),
              Text(
                '¿Confirmas tu suscripción al plan ${plan.name}?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                            color: Colors.white.withOpacity(0.15)),
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Cancelar'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '¡Bienvenido al plan ${plan.name}! 🎉'),
                            backgroundColor: plan.color,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: plan.color,
                        foregroundColor: Colors.white,
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: const Text('Confirmar',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Plan Card ──────────────────────────────────────────────────────────────────
class _PlanCard extends StatefulWidget {
  final _Plan plan;
  final bool isSelected;
  final bool isPopular;
  final VoidCallback onTap;

  const _PlanCard({
    required this.plan,
    required this.isSelected,
    required this.isPopular,
    required this.onTap,
  });

  @override
  State<_PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<_PlanCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isSelected || _hovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, active ? -6.0 : 0.0),
          decoration: BoxDecoration(
            color: active
                ? widget.plan.color.withOpacity(0.08)
                : const Color(0xFF111128),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: active
                  ? widget.plan.color.withOpacity(0.7)
                  : Colors.white.withOpacity(0.07),
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: widget.plan.color.withOpacity(0.25),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    )
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Popular badge
              if (widget.isPopular)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: widget.plan.color,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(14)),
                  ),
                  child: const Text(
                    '⭐  MÁS POPULAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(14)),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon + Name
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: widget.plan.color.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(widget.plan.icon,
                              color: widget.plan.color, size: 22),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.plan.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Price
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              color: widget.plan.color,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: widget.plan.price,
                            style: TextStyle(
                              color: widget.plan.color,
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                          ),
                          TextSpan(
                            text: '/${widget.plan.period}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      widget.plan.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.45),
                        fontSize: 12.5,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Divider(color: Colors.white.withOpacity(0.07)),
                    const SizedBox(height: 16),

                    // Features
                    ...widget.plan.features.map((f) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: f.included
                                      ? widget.plan.color.withOpacity(0.15)
                                      : Colors.white.withOpacity(0.04),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  f.included
                                      ? Icons.check_rounded
                                      : Icons.close_rounded,
                                  color: f.included
                                      ? widget.plan.color
                                      : Colors.white.withOpacity(0.2),
                                  size: 13,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  f.label,
                                  style: TextStyle(
                                    color: f.included
                                        ? Colors.white.withOpacity(0.85)
                                        : Colors.white.withOpacity(0.25),
                                    fontSize: 13,
                                    decoration: f.included
                                        ? null
                                        : TextDecoration.lineThrough,
                                    decorationColor:
                                        Colors.white.withOpacity(0.15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),

                    const SizedBox(height: 8),

                    // Select button
                    SizedBox(
                      width: double.infinity,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: widget.isSelected
                              ? widget.plan.color
                              : widget.plan.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: widget.plan.color.withOpacity(
                                widget.isSelected ? 0 : 0.3),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Text(
                          widget.isSelected ? '✓  Plan seleccionado' : 'Seleccionar plan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.isSelected
                                ? Colors.white
                                : widget.plan.color,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Comparison Table ───────────────────────────────────────────────────────────
class _ComparisonTable extends StatelessWidget {
  final List<_Plan> plans;

  const _ComparisonTable({required this.plans});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111128),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Características',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
                ...plans.map((p) => Expanded(
                      flex: 2,
                      child: Text(
                        p.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: p.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Divider(color: Colors.white.withOpacity(0.06), height: 1),

          // Rows
          _tableRow('Resolución', ['HD 720p', 'Full HD 1080p', '4K + HDR']),
          _tableRow('Pantallas simultáneas', ['1', '2', '4']),
          _tableRow('Descargas', ['No', 'Sí', 'Ilimitadas']),
          _tableRow('Perfiles', ['1', '4', 'Ilimitados']),
          _tableRow('Disney & Pixar', [null, null, null]),
          _tableRow('Marvel & Star Wars', [null, null, null]),
          _tableRow('National Geographic', ['No', 'Sí', 'Sí']),
        ],
      ),
    );
  }

  Widget _tableRow(String label, List<String?> values) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 13,
                  ),
                ),
              ),
              ...List.generate(3, (i) {
                final val = values[i];
                // null means included (checkmark)
                final included = val != 'No';
                return Expanded(
                  flex: 2,
                  child: Center(
                    child: val == null
                        ? Icon(Icons.check_rounded,
                            color: plans[i].color, size: 18)
                        : val == 'No'
                            ? Icon(Icons.close_rounded,
                                color: Colors.white.withOpacity(0.2), size: 16)
                            : Text(
                                val,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: included
                                      ? Colors.white.withOpacity(0.8)
                                      : Colors.white.withOpacity(0.25),
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                  ),
                );
              }),
            ],
          ),
        ),
        Divider(
            color: Colors.white.withOpacity(0.04), height: 1, indent: 24),
      ],
    );
  }
}

class _Plan {
  final int id;
  final String name;
  final String price;
  final String period;
  final Color color;
  final IconData icon;
  final String description;
  final List<_Feature> features;

  const _Plan({
    required this.id,
    required this.name,
    required this.price,
    required this.period,
    required this.color,
    required this.icon,
    required this.description,
    required this.features,
  });
}

class _Feature {
  final String label;
  final bool included;

  const _Feature(this.label, this.included);
}