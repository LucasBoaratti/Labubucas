import 'package:flutter/material.dart';
import 'package:labubucas/home.dart';
import 'package:labubucas/labubus.dart';
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
  List<Labubus> carrinhoProdutos = [];

  // Função para mudar o valor de acordo com a tela
  void mudarTela(int index) {
    setState(() {
      telaAtual = index;
    });
  }

  // Função para adicionar os produtos no carrinho
  void adicionarCarrinho(Labubus produto) {
    setState(() {
      carrinhoProdutos.add(produto);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> telas = [
      Home(onProdutos: () => mudarTela(2)),
      Carrinho(produtos: carrinhoProdutos),
      Produtos(onAdicionar: adicionarCarrinho),
    ];
    // Renderizando a barra de navegação inferior nas telas
    return Scaffold(
      body: IndexedStack(index: telaAtual, children: telas),
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
