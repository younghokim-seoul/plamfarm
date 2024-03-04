import 'package:floor/floor.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';


@dao
abstract class PalmFarmDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPalmFarmDevice(PalmFarmDevice model);

  @delete
  Future<void> deletePalmFarmDevice(PalmFarmDevice model);

  @Query('SELECT * FROM PalmFarmDevice ORDER BY createdAt')
  Stream<List<PalmFarmDevice>> findAllPalmFarmDevicesAsStream();

}
