import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:labubucas/labubus.dart';
import 'package:labubucas/produto_individual.dart';

class Produtos extends StatefulWidget {
  final Function(Labubus) onAdicionar;

  const Produtos({super.key, required this.onAdicionar});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  // Lista para interar por todos os dados
  List<Labubus> labubus = [];

  // Função de resetar a página toda vez que entra na página
  @override
  void initState() {
    super.initState();

    getLabubus();
  }

  // Função que busca os Labubus no firebase
  void getLabubus() {
    FirebaseFirestore.instance.collection("produtos").snapshots().listen((
      snapshots,
    ) {
      final produtos = snapshots.docs
          .map((doc) => Labubus.fromMap(doc.data()))
          .toList();

      setState(() {
        labubus = produtos;
      });
    });
  }

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
          // Título chamativo da página de produtos
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              "Confira os melhores produtos de Labubu aqui!",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          // Produtos de Labubu
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
              padding: EdgeInsets.all(16),
              children: labubus.map((produto) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdutoIndividual(produto: produto, onAdicionar: widget.onAdicionar),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff6F00BB),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          produto.imagem ?? "",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Text(
                          produto.nome ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "R\$ ${produto.precoAntigo?.toStringAsFixed(2) ?? ""}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.016,
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          "R\$ ${produto.preco?.toStringAsFixed(2) ?? ""}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
