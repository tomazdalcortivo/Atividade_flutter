import 'package:flutter/material.dart';

class SalvarStringPage extends StatefulWidget {
  const SalvarStringPage({super.key});

  @override
  State<SalvarStringPage> createState() => _SalvarStringPageState();
}

class _SalvarStringPageState extends State<SalvarStringPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _formularioEnviado = false;

  String? validarNome(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "O campo nome é obrigatório.";
    }
    final partes = valor.split(' ');
    if (partes.length < 2) {
      return "Insira pelo menos um nome e um sobrenome.";
    }
    return null;
  }

  String? validarEmail(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "O campo e-mail é obrigatório.";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(valor)) {
      return "Insira um e-mail válido.";
    }
    return null;
  }

  void enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _formularioEnviado = true;
      });
      print("Formulário enviado com sucesso!");
    } else {
      setState(() {
        _formularioEnviado = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  hintText: "Digite seu nome",
                  border: OutlineInputBorder(),
                ),
                validator: validarNome,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Digite seu e-mail",
                  border: OutlineInputBorder(),
                ),
                validator: validarEmail,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: enviarFormulario,
                child: const Text("Enviar"),
              ),
              const SizedBox(height: 20),
              if (_formularioEnviado)
                const Text(
                  "Enviado com sucesso!",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
