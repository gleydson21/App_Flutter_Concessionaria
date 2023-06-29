import 'package:app_concessionaria/domain/carros/carro.dart';
import 'package:app_concessionaria/application/carros/carro_dto.dart';

class CarroMapper {
  static Carro fromDto(CarroDTO dto, String id) {
    return Carro(
      id: id,
      marca: dto.marca,
      modelo: dto.modelo,
      ano: dto.ano,
      cor: dto.cor,
      imagemUrl: dto.imagemUrl,
    );
  }

  static CarroDTO toDto(Carro carro) {
    return CarroDTO(
      marca: carro.marca,
      modelo: carro.modelo,
      ano: carro.ano,
      cor: carro.cor,
      imagemUrl: carro.imagemUrl,
    );
  }
}