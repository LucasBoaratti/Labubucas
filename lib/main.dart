import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labubucas/firebase_options.dart';
import 'package:labubucas/home.dart';
void main() async {
  // Configurações do Firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inicializador do app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffECBA93),
        fontFamily: "Nunito",
        iconTheme: IconThemeData(
          color: Colors.transparent,
        ),
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Adicionando as variáveis de nome e senha para ver o que o usuário está digitando
  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();

  // Função resetadora de busca toda vez que entra na página
  @override
  void initState() {
    super.initState();
  }

  // Criando uma variável para armazenar erros
  String erro = "";

  Future<void> postLogin() async {
    // Criando as variáveis de verificação
    final nomeUsuario = nome.text.trim();
    final senhaUsuario = senha.text.trim();

    if (nomeUsuario.isEmpty || senhaUsuario.isEmpty) {
      setState(() {
        erro = "Digite um nome e uma senha, por favor.";
      });

      return;
    }

    try {
      // Instancia a coleção (tabela) e adiciona o nome e a senha do usuário
      FirebaseFirestore.instance.collection("usuarios").add({
        "nome": nomeUsuario,
        "senha": senhaUsuario,
      });

      setState(() {
        erro = "";
      });

      // Redireciona para a página home depois de publicar na tabela no banco de dados
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (error) {
      setState(() {
        erro = "Erro ao enviar dados: $error";
      });
    }
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto de boas vindas
            Text(
              "Seja bem-vindo(a) à Labubucas!!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontFamily: "Fredoka",
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // "Label" do campo nome
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Label do campo nome
                      Text(
                        "Nome",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      // Input do campo nome
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: nome,
                          decoration: InputDecoration(
                            hintText: "Digite seu nome...",
                            hintStyle: TextStyle(
                              color: Color(0xffA1A1A1),
                              fontSize: MediaQuery.of(context).size.height * 0.02,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.016,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Campo de senha
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Label" do campo senha
                      Text(
                        "Senha",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      // Input do campo senha
                      SizedBox(
                        width: 350,
                        child: TextField(
                          controller: senha,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Digite sua senha...",
                            hintStyle: TextStyle(
                              color: Color(0xffA1A1A1),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.016,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  erro.isNotEmpty ?
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05, 
                      child: Text(
                        erro,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                        ),
                      ),
                    ) :
                    SizedBox.shrink(), // Não ocupa espaço
                  // Botão de logar
                  ElevatedButton(
                    onPressed: postLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6F00BB),
                      minimumSize: Size(160, 50),
                    ),
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
