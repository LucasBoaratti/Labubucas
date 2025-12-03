import 'package:flutter/material.dart';
import 'package:labubucas/home.dart';
import 'package:labubucas/produtos.dart';
import 'package:labubucas/carrinho.dart';

// Arquivo separado para renderizar a barra de navegação inferior
class BarraNavegacaoInferior extends StatefulWidget {
  const BarraNavegacaoInferior({super.key});

  @override
  State<BarraNavegacaoInferior> createState() => _BarraNavegacaoInferiorState();
}

class _BarraNavegacaoInferiorState extends State<BarraNavegacaoInferior> {
  // Variável que indica a posição da tela
  int telaAtual = 0;

  // Função para mudar o valor de acordo com a tela
  void mudarTela(int index) {
    setState(() {
      telaAtual = index;
    });
  }

  // Lista que contém todas as telas do site
  List<Widget> telas = [Home(), Carrinho(), Produtos()];

  @override
  Widget build(BuildContext context) {
    // Renderizando a barra de navegação inferior nas telas
    return Scaffold(
      body: telas[telaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: telaAtual,
        onTap: mudarTela,
        backgroundColor: Color(0xff6F00BB),
        // Tela atual
        selectedLabelStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.018,
        ),
        selectedItemColor: Colors.white,
        // Outras telas
        unselectedLabelStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.018,
        ),
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 40),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 40),
            label: "Carrinho",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory, size: 40),
            label: "Produtos",
          ),
        ],
      ),
    );
  }
}
