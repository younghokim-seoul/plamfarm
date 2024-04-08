import 'package:palmfarm/data/local/palm_farm_dao.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/domain/repository/local_repository.dart';
import 'package:palmfarm/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepositoryImpl extends LocalRepository {
  final Future<SharedPreferences> _instanceFuture = SharedPreferences.getInstance();
  final PalmFarmDAO _palmFarmDAO;

  LocalRepositoryImpl(this._palmFarmDAO);

  @override
  Future<void> deleteDevice(PalmFarmDevice model) async => await _palmFarmDAO.deletePalmFarmDevice(model);

  @override
  Stream<List<PalmFarmDevice>> getAllPalmFarmItems() => _palmFarmDAO.findAllPalmFarmDevicesAsStream();

  @override
  Future<void> saveDevice(PalmFarmDevice model) async => await _palmFarmDAO.insertPalmFarmDevice(model);

  @override
  Stream<List<PrivateSetting>> getAllPrivateSettingItems(String macAddress) =>
      _palmFarmDAO.findAllPrivateSettingsAsStream(macAddress);

  @override
  Future<void> savePrivateSetting(PrivateSetting model) async => await _palmFarmDAO.insertPrivateSetting(model);

  @override
  Future<void> savePrivateSettings(List<PrivateSetting> models) async =>
      await _palmFarmDAO.insertPrivateSettings(models);

  @override
  Future<PalmFarmDevice?> findPalmFarmDevice(String macAddress) async => _palmFarmDAO.findPalmFarmDevice(macAddress);

  @override
  Future<String> getUserName() async {
    final pref = await _instanceFuture;
    return pref.getString(Const.pref_nick_name) ?? "";
  }

  @override
  Future<void> saveUserName({required String userIds}) async {
    final prefs = await _instanceFuture;
    await prefs.setString(Const.pref_nick_name, userIds);
  }

  @override
  Future<List<PalmFarmDevice>> getOnceAllPalmFarmDevices() async => await _palmFarmDAO.findAllPalmFarmDevices();
}
