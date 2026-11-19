import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPages extends StatefulWidget {
  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Mengatur animasi progress bar selama 5 detik seperti contoh dosen
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward().whenComplete(() {
      _cekStatusLogin();
    });
  }

  Future<void> _cekStatusLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');

    if (!mounted) return;

    if (savedUsername != null && savedUsername.isNotEmpty) {
      // Jika sudah pernah login sebelumnya, langsung masuk ke Beranda
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: savedUsername,
      );
    } else {
      // Jika belum login, arahkan ke halaman Login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flutter_dash,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              const Text(
                "Ini Splash Screen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Memuat aplikasi...",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),
              LinearProgressIndicator(
                value: _animationController.value,
                minHeight: 8,
                borderRadius: BorderRadius.circular(8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}