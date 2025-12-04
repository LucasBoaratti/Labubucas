import 'package:flutter/material.dart';
import 'package:labubucas/labubus.dart';

class Carrinho extends StatefulWidget {
  // Chamando a classe onde as informações dos Labubus estão
  final List<Labubus> produtos;

  const Carrinho({super.key, required this.produtos});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}