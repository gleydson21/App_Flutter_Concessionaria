class Carro {
  final String id;
  final String marca;
  final String modelo;
  final int ano;
  final String cor;
  final String imagemUrl;

  Carro({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.cor,
    required this.imagemUrl,
  });

  factory Carro.fromJson(Map<String, dynamic> json) {
    return Carro(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      ano: json['ano'],
      cor: json['cor'],
      imagemUrl: json['imagemUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'cor': cor,
      'imagemUrl': imagemUrl,
    };
  }

  copyWith({required String marca, required String modelo, required int ano, required String cor, required String imagemUrl}) {}
}
