import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/tombol_utama.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _name = "";
  final TextEditingController _nameController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text("Increment"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text("Decrement"),
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              "Ganti Nama",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            InputField(
              controller: _nameController,
              hint: "Input Nama",
              icon: Icons.badge,
            ),
            const SizedBox(height: 12),
            TombolUtama(
              label: "Tampilkan Nama",
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                });
              },
            ),
            const SizedBox(height: 12),
            Text(
              "Nama Saya $_name",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            TombolUtama(
              label: "Hapus Nama",
              onPressed: () {
                setState(() {
                  _nameController.clear();
                  _name = "";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}