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

  double get preco => 0.0; // implementação de exemplo

  Carro copyWith({
    String? id,
    String? marca,
    String? modelo,
    int? ano,
    String? cor,
    String? imagemUrl,
  }) {
    return Carro(
      id: id ?? this.id,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      ano: ano ?? this.ano,
      cor: cor ?? this.cor,
      imagemUrl: imagemUrl ?? this.imagemUrl,
    );
  }
}
