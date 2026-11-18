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
    setState(() {
      _username = _usernameController.text;
      _password = _passwordController.text;
    });
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderLogin(judul: "Silakan Login"),
            const SizedBox(height: 24),
            InputField(
              controller: _usernameController,
              hint: "Username",
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: _passwordController,
              hint: "Password",
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            TombolUtama(
              label: "Login",
              onPressed: _handleLogin,
            ),
            const SizedBox(height: 16),
            KartuHasilLogin(
              username: _username,
              password: _password,
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: "Halaman Utama"),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Ke MyHomePage (Ganti Nama)"),
            ),
          ],
        ),
      ),
    );
  }
}