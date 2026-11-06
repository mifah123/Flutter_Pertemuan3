import 'package:flutter/material.dart';
import 'crud_screen.dart';
import 'post_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const _orange = Color(0xFFFF8A3D);
  static const _purple = Color(0xFF7B5CFA);
  static const _purpleDark = Color(0xFF3B2BB5);

  void _comingSoon(BuildContext context, String name) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$name segera hadir')));
  }

  void _open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final menus = <_MenuItem>[
      _MenuItem(
        title: 'Pengumuman',
        subtitle: 'Berita terbaru',
        icon: Icons.campaign_rounded,
        colors: const [Color(0xFFFFB347), Color(0xFFFF7A18)],
        onTap: () => _open(context, const PostPage()),
      ),
      _MenuItem(
        title: 'Kelola Materi',
        subtitle: 'Tambah & ubah data',
        icon: Icons.edit_note_rounded,
        colors: const [Color(0xFF9B7BFF), Color(0xFF5B3FE0)],
        onTap: () => _open(context, const CrudScreen()),
      ),
      _MenuItem(
        title: 'Jadwal Kuliah',
        subtitle: 'Jadwal mingguan',
        icon: Icons.calendar_month_rounded,
        colors: const [Color(0xFFFF9F6B), Color(0xFFE0568A)],
        onTap: () => _comingSoon(context, 'Jadwal Kuliah'),
      ),
      _MenuItem(
        title: 'KRS / Nilai',
        subtitle: 'Hasil studi',
        icon: Icons.assignment_turned_in_rounded,
        colors: const [Color(0xFFB57BFF), Color(0xFF7B3FE0)],
        onTap: () => _comingSoon(context, 'KRS / Nilai'),
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Menu Utama',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 14),
                      LayoutBuilder(
                        builder: (context, c) {
                          const gap = 14.0;
                          final cols = c.maxWidth >= 560 ? 4 : 2;
                          final w = (c.maxWidth - gap * (cols - 1)) / cols;
                          return Wrap(
                            spacing: gap,
                            runSpacing: gap,
                            children: [
                              for (final m in menus)
                                SizedBox(
                                  width: w,
                                  height: 132,
                                  child: _MenuCard(item: m),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Agenda Hari Ini',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 14),
                      const _AgendaTile(
                        time: '08.00',
                        title: 'Pemrograman Aplikasi Mobile',
                        place: 'Lab Komputer 2',
                        color: _orange,
                      ),
                      const SizedBox(height: 12),
                      const _AgendaTile(
                        time: '10.30',
                        title: 'Basis Data Lanjut',
                        place: 'Ruang B.204',
                        color: _purple,
                      ),
                      const SizedBox(height: 12),
                      const _AgendaTile(
                        time: '13.00',
                        title: 'Rekayasa Perangkat Lunak',
                        place: 'Ruang A.101',
                        color: Color(0xFFE0568A),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_orange, _purple, _purpleDark],
          stops: [0.0, 0.55, 1.0],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
      ),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.2),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.6),
                            width: 2,
                          ),
                        ),
                        child: const Icon(Icons.person_rounded,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat datang,',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withValues(alpha: 0.85),
                              ),
                            ),
                            Text(
                              'Mahasiswa Unigal',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.notifications_none_rounded,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Kelola aktivitas\nakademikmu dengan mudah',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Semester 5  •  Tahun Ajaran 2026/2027',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Row(
                    children: [
                      Expanded(
                        child: _StatChip(
                          icon: Icons.menu_book_rounded,
                          value: '6',
                          label: 'Mata Kuliah',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _StatChip(
                          icon: Icons.layers_rounded,
                          value: '20',
                          label: 'Total SKS',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _StatChip(
                          icon: Icons.star_rounded,
                          value: '3.78',
                          label: 'IPK',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatChip({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;
  final VoidCallback onTap;

  const _MenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
    required this.onTap,
  });
}

class _MenuCard extends StatelessWidget {
  final _MenuItem item;

  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: item.onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: item.colors,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: item.colors.last.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(item.icon, color: Colors.white, size: 24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
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

class _AgendaTile extends StatelessWidget {
  final String time;
  final String title;
  final String place;
  final Color color;

  const _AgendaTile({
    required this.time,
    required this.title,
    required this.place,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 64,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                time,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 14,
                          color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(
                        place,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                color: theme.colorScheme.outline),
          ],
        ),
      ),
    );
  }
}