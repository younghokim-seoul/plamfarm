


import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';

abstract class LocalRepository {
  Future<void> saveDevice(PalmFarmDevice model);
  Future<void> deleteDevice(PalmFarmDevice model);
  Stream<List<PalmFarmDevice>> getAllPalmFarmItems();
  Future<PalmFarmDevice?> findPalmFarmDevice(String macAddress);



  Future<void> savePrivateSettings(List<PrivateSetting> models);
  Future<void> savePrivateSetting(PrivateSetting model);
  Stream<List<PrivateSetting>> getAllPrivateSettingItems(String macAddress);
}