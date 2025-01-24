import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioPage(),
    );
  }
}

class FormularioPage extends StatefulWidget {
  @override
  FormularioPageState createState() => FormularioPageState();
}

class FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu nome',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O nome é obrigatório.';
                  }
                  if (!value.contains(' ')) {
                    return 'Digite pelo menos um sobrenome.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu e-mail',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O e-mail é obrigatório.';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Digite um e-mail válido.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Formulário enviado com sucesso!');
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
