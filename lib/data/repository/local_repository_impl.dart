import 'package:palmfarm/data/local/palm_farm_dao.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final PalmFarmDAO _palmFarmDAO;

  LocalRepositoryImpl(this._palmFarmDAO);

  @override
  Future<void> delete(PalmFarmDevice model) async => await _palmFarmDAO.deletePalmFarmDevice(model);

  @override
  Stream<List<PalmFarmDevice>> getAllPalmFarmItems() => _palmFarmDAO.findAllPalmFarmDevicesAsStream();

  @override
  Future<void> save(PalmFarmDevice model) async => await _palmFarmDAO.insertPalmFarmDevice(model);
}
