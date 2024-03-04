


import 'package:palmfarm/data/local/vo/palm_farm_device.dart';

abstract class LocalRepository {
  Future<void> save(PalmFarmDevice model);
  Future<void> delete(PalmFarmDevice model);
  Stream<List<PalmFarmDevice>> getAllPalmFarmItems();
}