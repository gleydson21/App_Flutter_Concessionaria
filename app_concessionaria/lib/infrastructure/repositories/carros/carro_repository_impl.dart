import 'package:app_concessionaria/infrastructure/database/carros/carros_database.dart';
import 'package:app_concessionaria/domain/carros/carro.dart';
import 'package:app_concessionaria/infrastructure/repositories/carros/carro_repository.dart'
    show CarroRepository;

class CarroRepositoryImpl implements CarroRepository {
  final carrosDatabase = CarrosDatabase.instance;

  @override
  Future<List<Carro>> getCarros() async {
    final carrosJson = await carrosDatabase.getCarros();
    final carros = carrosJson.map((json) => Carro.fromJson(json)).toList();
    return carros;
  }

  @override
  Future<Carro?> getCarroById(String id) async {
    return await carrosDatabase.getCarroById(id);
  }

  @override
  Future<void> saveCarro(Carro carro) async {
    // ignore: unnecessary_null_comparison
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
