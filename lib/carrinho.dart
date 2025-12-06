import 'package:flutter/material.dart';
import 'package:labubucas/labubus.dart';
import 'package:labubucas/pagamento.dart';

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
          // Texto introdutivo do carrinho de compras
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            "Carrinho de compras",
            style: TextStyle(
              fontFamily: "Fredoka",
              fontSize: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Card de produto no carrinho
          Expanded(
            child: ListView.builder(
              itemCount: widget.produtos.length,
              itemBuilder: (context, index) {
                final produto = widget.produtos[index];
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xff6F00BB)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Image.asset(
                              "assets/images/Labubu_Chaveiro.png",
                              // Usar image.network depois...
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              color: Color(0xff6F00BB),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    produto.nome ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.height * 0.02,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    "Quantidade: 1 unidade",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    "Preço: R\$ ${produto.preco?.toStringAsFixed(2) ?? "0,00"}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.height * 0.018,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    "Frete: R\$ 59,99",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.height * 0.018,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    "Total: R\$ ${((produto.preco ?? 0) + 59.99).toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.height * 0.02,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.010),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffC1F80A),
                                      ),
                                      child: Text(
                                        "Retirar",                                                                               
                                        style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height * 0.018),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    // Botão de realizar pagamento
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => Pagamento(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6F00BB),
                      ),
                      child: Text(
                        "Realizar pagamento",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
