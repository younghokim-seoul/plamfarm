import 'package:floor/floor.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';


@dao
abstract class PalmFarmDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPalmFarmDevice(PalmFarmDevice model);

  @delete
  Future<void> deletePalmFarmDevice(PalmFarmDevice model);

  @Query('SELECT * FROM PalmFarmDevice ORDER BY createdAt')
  Future<List<PalmFarmDevice>> findAllPalmFarmDevices();

  @Query('SELECT * FROM PalmFarmDevice ORDER BY createdAt')
  Stream<List<PalmFarmDevice>> findAllPalmFarmDevicesAsStream();

  @Query('SELECT * FROM PalmFarmDevice WHERE macAddress = :macAddress')
  Future<PalmFarmDevice?> findPalmFarmDevice(String macAddress);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPrivateSettings(List<PrivateSetting> settingList);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPrivateSetting(PrivateSetting model);

  @Query('SELECT * FROM PrivateSetting WHERE macAddress = :macAddress ORDER BY secretNumber')
  Stream<List<PrivateSetting>> findAllPrivateSettingsAsStream(String macAddress);

}
