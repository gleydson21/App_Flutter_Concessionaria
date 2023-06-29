import 'package:app_concessionaria/domain/carros/carro.dart' show Carro;

abstract class CarroRepository {
  Future<List<Carro>> getCarros();

  Future<Carro?> getCarroById(String id);

  Future<void> saveCarro(Carro carro);

  Future<void> deleteCarro(String id);
}
