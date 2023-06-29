class CarroDTO {
  final String marca;
  final String modelo;
  final int ano;
  final String cor;
  final String imagemUrl;

  CarroDTO({
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.cor,
    required this.imagemUrl,
  });

  factory CarroDTO.fromJson(Map<String, dynamic> json) {
    return CarroDTO(
      marca: json['marca'] as String,
      modelo: json['modelo'] as String,
      ano: json['ano'] as int,
      cor: json['cor'] as String,
      imagemUrl: json['imagemUrl'] as String,
    );
  }
}
