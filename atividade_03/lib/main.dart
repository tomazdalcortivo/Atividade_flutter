import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferencesPage(),
    );
  }
}

class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  String? _nome;
  String? _idade;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString('nome') ?? '';
      _idade = prefs.getString('idade') ?? '';
    });
  }

  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', _nomeController.text);
    await prefs.setString('idade', _idadeController.text);
    setState(() {
      _nome = _nomeController.text;
      _idade = _idadeController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SharedPreferences')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite seu nome',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _idadeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite sua idade',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _salvarDados,
              child: Text('Salvar'),
            ),
            SizedBox(height: 16),
            if (_nome != null && _idade != null)
              Text('Nome: $_nome, Idade: $_idade'),
          ],
        ),
      ),
    );
  }
}
