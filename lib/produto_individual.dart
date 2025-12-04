import 'package:flutter/material.dart';
import 'package:labubucas/carrinho.dart';
import 'package:labubucas/labubus.dart';

// Classe que recebe os detalhes do produtos para ser mandado para a próxima tela
class ProdutoIndividual extends StatelessWidget {
  // Chamando a classe onde as informações dos Labubus estão
  final Labubus produto;
  final Function(Labubus) onAdicionar;

  const ProdutoIndividual({super.key, required this.produto, required this.onAdicionar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/Logo_Labubucas.png"),
        centerTitle: true,
        backgroundColor: Color(0xff6F00BB),
        toolbarHeight:
            MediaQuery.of(context).size.height * 0.1, // Largura responsiva
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          // Imagem do produto
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Color(0xff6F00BB)),
            child: Image.network(
              produto.imagem ?? "",
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Nome do produto
          Text(
            produto.nome ?? "",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Preço e preço antigo do produto
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Text(
                  "R\$ ${produto.preco?.toStringAsFixed(2) ?? ""}",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.015),
              Text(
                "R\$ ${produto.precoAntigo?.toStringAsFixed(2) ?? ""}",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                  decoration: TextDecoration.lineThrough,
                  color: Color(0xffa1a1a160),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          // Unidades do produto
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Unidades restantes: ${produto.unidades?.toString() ?? "0"}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          // Descrição do produto
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Text(
              produto.descricao ?? "",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.016,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ElevatedButton(
            onPressed: () {
              onAdicionar(produto);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff6F00BB)),
            child: Text(
              "Adicionar ao carrinho",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.016,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
