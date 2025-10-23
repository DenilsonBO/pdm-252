import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _segundos = 0;
  Timer? _timer;
  bool _rodando = false;

  void _iniciarTimer() {
    if (_rodando) return; // evita iniciar várias vezes
    _rodando = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _segundos++;
      });
    });
  }

  void _pararTimer() {
    _timer?.cancel();
    _rodando = false;
  }

  void _resetarTimer() {
    _pararTimer();
    setState(() {
      _segundos = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tempo: $_segundos s',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _iniciarTimer,
              child: const Text('Iniciar Timer'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pararTimer,
              child: const Text('Parar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _resetarTimer,
              child: const Text('Resetar'),
            ),
          ],
        ),
      ),
    );
  }
}
