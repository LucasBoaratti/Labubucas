import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final VoidCallback onProdutos;

  const Home({super.key, required this.onProdutos});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // Banner da Labubucas
              Image.asset("assets/images/Banner_Labubucas.png"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.035,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tipos de Labubus disponíveis para a venda
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InkWell(
                          onTap: widget.onProdutos,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(width: 165, height: 160),
                              // Cor de fundo para o container
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff6F00BB),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Labubus \nanimados",
                                    style: TextStyle(
                                      fontFamily: "Fredoka",
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                          0.02,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset("assets/images/Labubu_Luffy.png"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        InkWell(
                          onTap: widget.onProdutos,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(width: 165, height: 160),
                              // Cor de fundo para o container
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff6F00BB),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Labubus \nsimples",
                                    style: TextStyle(
                                      fontFamily: "Fredoka",
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                          0.02,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/Labubu_Simples.png",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: widget.onProdutos,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(width: 165, height: 160),
                              // Cor de fundo para o container
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff6F00BB),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Chaveiros",
                                    style: TextStyle(
                                      fontFamily: "Fredoka",
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                          0.02,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/Chaveiro_Labubu.png",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        InkWell(
                          onTap: widget.onProdutos,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(width: 165, height: 160),
                              // Cor de fundo para o container
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff6F00BB),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Diversos",
                                    style: TextStyle(
                                      fontFamily: "Fredoka",
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                          0.02,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/Camiseta_Labubu.png",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              // Labubus da categoria de recomendações para você
              Column(
                children: [
                  Text(
                    "Recomendações para você",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontFamily: "Fredoka",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height * 0.025,
                      vertical: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: widget.onProdutos,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(width: 180, height: 250),
                                  // Cor de fundo para o container
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xff6F00BB),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/Labubu_Grogu.png",
                                        ),
                                        Text(
                                          "Labubu Grogu 7cm \ncom chaveiro",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.018,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "R\$299,99",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.016,
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        Text(
                                          "R\$199,99",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.018,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.025,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: widget.onProdutos,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(width: 180, height: 250),
                                  // Cor de fundo para o container
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xff6F00BB),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/Labubu_Roupa_Marrom.png",
                                        ),
                                        Text(
                                          "Labubu de ursinho \ncom roupa marrom",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.018,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "R\$199,99",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.016,
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        Text(
                                          "R\$159,99",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.018,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: widget.onProdutos,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(width: 220, height: 250),
                                // Cor de fundo para o container
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff6F00BB),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/Labubu_Roupa_Banana.png",
                                      ),
                                      Text(
                                        "Labubu com roupa \nde banana",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.018,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "R\$99,99",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.016,
                                          color: Colors.white,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Text(
                                        "R\$79,99",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.018,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.025,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: widget.onProdutos,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(width: 220, height: 250),
                                // Cor de fundo para o container
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff6F00BB),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/Labubu_Chaveiro.png",
                                      ),
                                      Text(
                                        "Chaveiro labubu cor \nazul e roxo",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.018,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "R\$69,99",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.016,
                                          color: Colors.white,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Text(
                                        "R\$39,99",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.018,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
