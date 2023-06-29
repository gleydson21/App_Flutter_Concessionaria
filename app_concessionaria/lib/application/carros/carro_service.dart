import 'package:app_concessionaria/domain/carros/carro.dart';

import 'carro_repository.dart';

class CarroService {
  final CarroRepository _carroRepository;

  CarroService(this._carroRepository);

  Future<List<Carro>> getCarros() async {
    return await _carroRepository.getCarros();
  }

  Future<Carro> getCarroById(String id) async {
    return await _carroRepository.getCarroById(id);
  }

  Future<void> saveCarro(Carro carro) async {
    await _carroRepository.saveCarro(carro);
  }

  Future<void> deleteCarro(String id) async {
    await _carroRepository.deleteCarro(id);
  }
}
