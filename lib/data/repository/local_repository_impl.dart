import 'package:palmfarm/data/local/palm_farm_dao.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final PalmFarmDAO _palmFarmDAO;

  LocalRepositoryImpl(this._palmFarmDAO);

  @override
  Future<void> deleteDevice(PalmFarmDevice model) async => await _palmFarmDAO.deletePalmFarmDevice(model);

  @override
  Stream<List<PalmFarmDevice>> getAllPalmFarmItems() => _palmFarmDAO.findAllPalmFarmDevicesAsStream();

  @override
  Future<void> saveDevice(PalmFarmDevice model) async => await _palmFarmDAO.insertPalmFarmDevice(model);

  @override
  Stream<List<PrivateSetting>> getAllPrivateSettingItems(String macAddress) => _palmFarmDAO.findAllPrivateSettingsAsStream(macAddress);

  @override
  Future<void> savePrivateSetting(PrivateSetting model) async => await _palmFarmDAO.insertPrivateSetting(model);

  @override
  Future<void> savePrivateSettings(List<PrivateSetting> models) async => await _palmFarmDAO.insertPrivateSettings(models);

  @override
  Future<PalmFarmDevice?> findPalmFarmDevice(String macAddress) async => _palmFarmDAO.findPalmFarmDevice(macAddress);
}
