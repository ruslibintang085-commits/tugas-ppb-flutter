import 'package:flutter/material.dart';

class KartuHasilLogin extends StatelessWidget {
  const KartuHasilLogin({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hasil Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(),
            Text("Username: $username"),
            const SizedBox(height: 4),
            Text("Password: $password"),
          ],
        ),
      ),
    );
  }
}