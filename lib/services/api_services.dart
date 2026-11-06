import '../models/post.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    // Simulasi loading sebentar supaya terasa seperti ambil data dari server
    await Future.delayed(const Duration(milliseconds: 600));

    return _beritaKampus
        .map((e) => Post.fromJson(e))
        .toList();
  }

  static const List<Map<String, dynamic>> _beritaKampus = [
    {
      'id': 1,
      'userId': 1,
      'title': 'Jadwal Ujian Akhir Semester Ganjil 2026/2027',
      'body':
          'Ujian Akhir Semester (UAS) akan dilaksanakan mulai tanggal 5 Januari 2027. Mahasiswa diharapkan memeriksa jadwal lengkap melalui portal akademik dan memastikan tidak memiliki tunggakan administrasi.',
    },
    {
      'id': 2,
      'userId': 1,
      'title': 'Pendaftaran Wisuda Periode Desember Dibuka',
      'body':
          'Bagi mahasiswa yang telah menyelesaikan seluruh persyaratan kelulusan, pendaftaran wisuda dibuka hingga akhir bulan ini. Silakan melengkapi berkas di bagian akademik.',
    },
    {
      'id': 3,
      'userId': 2,
      'title': 'Pengumuman Beasiswa Prestasi Akademik',
      'body':
          'Universitas membuka beasiswa prestasi untuk mahasiswa dengan IPK minimal 3,50. Pendaftaran dilakukan secara daring melalui website resmi kampus.',
    },
    {
      'id': 4,
      'userId': 2,
      'title': 'Libur Nasional dan Perubahan Jadwal Perkuliahan',
      'body':
          'Sehubungan dengan libur nasional, perkuliahan pada tanggal tersebut ditiadakan. Jadwal pengganti akan diinformasikan oleh masing-masing dosen pengampu.',
    },
    {
      'id': 5,
      'userId': 3,
      'title': 'Seminar Nasional Teknologi Informasi 2026',
      'body':
          'Fakultas Teknik mengundang seluruh mahasiswa untuk mengikuti seminar nasional dengan tema transformasi digital. Peserta akan mendapatkan sertifikat dan poin kegiatan.',
    },
    {
      'id': 6,
      'userId': 3,
      'title': 'Perpanjangan Masa Pembayaran UKT',
      'body':
          'Bagian keuangan memperpanjang batas pembayaran UKT semester ini. Mahasiswa yang belum membayar diharapkan segera menyelesaikan pembayaran agar dapat mengisi KRS.',
    },
    {
      'id': 7,
      'userId': 4,
      'title': 'Open Recruitment Organisasi Kemahasiswaan',
      'body':
          'BEM dan UKM kampus membuka pendaftaran anggota baru. Ayo bergabung dan kembangkan bakat serta kemampuan kepemimpinanmu bersama teman-teman lainnya.',
    },
    {
      'id': 8,
      'userId': 4,
      'title': 'Pembaruan Layanan Perpustakaan Digital',
      'body':
          'Perpustakaan kini menyediakan akses jurnal dan e-book secara daring. Mahasiswa dapat masuk menggunakan akun SIAKAD tanpa perlu datang langsung ke kampus.',
    },
  ];
}