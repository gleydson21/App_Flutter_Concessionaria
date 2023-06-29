import 'package:app_concessionaria/infrastructure/database/carros/carros_database.dart';
import 'package:app_concessionaria/domain/carros/carro.dart';
import 'package:app_concessionaria/repositories/carros/carro_repository.dart';

import '../../../application/carros/carro_repository.dart';

class CarroRepositoryImpl implements CarroRepository {
  final carrosDatabase = CarrosDatabase.instance;

  @override
  Future<List<Carro>> getCarros() async {
    return await carrosDatabase.getCarros();
  }

  @override
  Future<Carro?> getCarroById(String id) async {
    return await carrosDatabase.getCarroById(id);
  }

  @override
  Future<void> saveCarro(Carro carro) async {
    if (carro.id != null) {
      await carrosDatabase.updateCarro(carro);
    } else {
      await carrosDatabase.addCarro(carro);
    }
  }

  @override
  Future<void> deleteCarro(String id) async {
    await carrosDatabase.deleteCarro(id);
  }
}