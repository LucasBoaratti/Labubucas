// Classe que pega os campos dos produtos de Labubu
class Labubus {
  final String? nome;
  final String? descricao;
  final String? imagem;
  final double? preco;
  final double? precoAntigo;
  final int? unidades;

  Labubus({
    required this.nome,
    this.descricao,
    required this.imagem,
    required this.preco,
    required this.precoAntigo,
    this.unidades,
  });

  // Buscando os produtos
  factory Labubus.fromMap(Map<String, dynamic> map) {
    return Labubus(
      nome: map["nome"] ?? "",
      descricao: map["descricao"] ?? "",
      imagem: map["imagem"] ?? "",
      preco: double.tryParse(map["preco"].toString()) ?? 0.0,
      precoAntigo: double.tryParse(map["precoAntigo"].toString()) ?? 0.0,
      unidades: int.tryParse(map["unidades"].toString()) ?? 0,
    );
  }
}