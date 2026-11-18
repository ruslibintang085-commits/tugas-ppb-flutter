import 'package:flutter/material.dart';
import '../widgets/header_login.dart';
import '../widgets/input_field.dart';
import '../widgets/tombol_utama.dart';
import '../widgets/kartu_hasil_login.dart';
import 'my_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    final inputUser = _usernameController.text.trim();
    final inputPass = _passwordController.text.trim();

    if (inputUser.isEmpty || inputPass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username dan Password wajib diisi!"),
        ),
      );
      return;
    }

    setState(() {
      _username = inputUser;
      _password = inputPass;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(
          title: "Home / Beranda",
          username: inputUser,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderLogin(judul: "Welcome Back"),
                const SizedBox(height: 6),
                const Text(
                  "Silakan masuk menggunakan akun Anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 24),
                InputField(
                  controller: _usernameController,
                  hint: "Username atau NIM",
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _passwordController,
                  hint: "Password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                TombolUtama(
                  label: "Login",
                  onPressed: _handleLogin,
                ),
                const SizedBox(height: 20),
                KartuHasilLogin(
                  username: _username,
                  password: _password,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}