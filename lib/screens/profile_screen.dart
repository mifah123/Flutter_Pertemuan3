import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _orange = Color(0xFFFF8A3D);
  static const _purple = Color(0xFF7B5CFA);
  static const _purpleDark = Color(0xFF3B2BB5);

  Future<void> _confirmLogout(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Keluar dari akun?'),
        content: const Text('Anda perlu masuk lagi untuk menggunakan aplikasi.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              minimumSize: const Size(96, 44),
              backgroundColor: Theme.of(ctx).colorScheme.error,
              foregroundColor: Theme.of(ctx).colorScheme.onError,
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );

    if (ok == true && context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  void _comingSoon(BuildContext context, String name) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$name segera hadir')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Akun',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 14),
                      const Card(
                        child: Column(
                          children: [
                            _InfoTile(
                              icon: Icons.badge_outlined,
                              label: 'Nama Lengkap',
                              value: 'Mahasiswa Unigal',
                              colors: [Color(0xFFFFB347), Color(0xFFFF7A18)],
                            ),
                            Divider(height: 1, indent: 16, endIndent: 16),
                            _InfoTile(
                              icon: Icons.mail_outline_rounded,
                              label: 'Email',
                              value: 'mahasiswa@unigal.ac.id',
                              colors: [Color(0xFF9B7BFF), Color(0xFF5B3FE0)],
                            ),
                            Divider(height: 1, indent: 16, endIndent: 16),
                            _InfoTile(
                              icon: Icons.school_outlined,
                              label: 'Universitas',
                              value: 'Universitas Galuh',
                              colors: [Color(0xFFFF9F6B), Color(0xFFE0568A)],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Pengaturan',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 14),
                      Card(
                        child: Column(
                          children: [
                            _MenuTile(
                              icon: Icons.edit_outlined,
                              title: 'Ubah Profil',
                              onTap: () => _comingSoon(context, 'Ubah Profil'),
                            ),
                            const Divider(height: 1, indent: 16, endIndent: 16),
                            _MenuTile(
                              icon: Icons.lock_outline_rounded,
                              title: 'Ganti Kata Sandi',
                              onTap: () =>
                                  _comingSoon(context, 'Ganti Kata Sandi'),
                            ),
                            const Divider(height: 1, indent: 16, endIndent: 16),
                            _MenuTile(
                              icon: Icons.notifications_none_rounded,
                              title: 'Notifikasi',
                              onTap: () => _comingSoon(context, 'Notifikasi'),
                            ),
                            const Divider(height: 1, indent: 16, endIndent: 16),
                            _MenuTile(
                              icon: Icons.help_outline_rounded,
                              title: 'Bantuan',
                              onTap: () => _comingSoon(context, 'Bantuan'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      OutlinedButton.icon(
                        onPressed: () => _confirmLogout(context),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(52),
                          foregroundColor: theme.colorScheme.error,
                          side: BorderSide(
                            color: theme.colorScheme.error
                                .withValues(alpha: 0.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        icon: const Icon(Icons.logout_rounded),
                        label: const Text('Keluar (Logout)'),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Unigal Apps v1.0.0',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.outline,
                          ),
                        ),
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
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Profil Pengguna',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.7),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          child: const Icon(Icons.person_rounded,
                              size: 54, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.camera_alt_rounded,
                              size: 17, color: _purpleDark),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Mahasiswa Unigal',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'mahasiswa@unigal.ac.id',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.35)),
                    ),
                    child: Text(
                      'Mahasiswa Aktif  •  Semester 5',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Row(
                    children: [
                      Expanded(
                        child: _StatChip(value: '6', label: 'Mata Kuliah'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _StatChip(value: '20', label: 'Total SKS'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _StatChip(value: '3.78', label: 'IPK'),
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
  final String value;
  final String label;

  const _StatChip({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
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

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<Color> colors;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.last.withValues(alpha: 0.28),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, size: 22, color: Colors.white),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodySmall
            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
      ),
      subtitle: Text(
        value,
        style: theme.textTheme.bodyMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ProfileScreen._purple.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 20, color: ProfileScreen._purple),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
      trailing: Icon(Icons.chevron_right_rounded,
          color: theme.colorScheme.outline),
    );
  }
}