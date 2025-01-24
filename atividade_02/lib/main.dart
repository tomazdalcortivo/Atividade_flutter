import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TelaInicial(),
        '/detalhes': (context) => TelaDetalhes(),
        '/configuracoes': (context) => TelaConfiguracoes(),
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed('/detalhes'),
          child: Text('Ir para Detalhes'),
        ),
      ),
    );
  }
}

class TelaDetalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed('/configuracoes'),
          child: Text('Ir para Configurações'),
        ),
      ),
    );
  }
}

class TelaConfiguracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: Text('Voltar à Tela Inicial'),
        ),
      ),
    );
  }
}
