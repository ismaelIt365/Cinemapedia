import 'package:flutter/material.dart';

class CategoriasView extends StatelessWidget {
  const CategoriasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias View'),
      ),
      body: const Center(child: Text('Categorias')),
    );
  }
}
