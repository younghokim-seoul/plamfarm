import 'dart:async';

import 'package:floor/floor.dart';
import 'package:palmfarm/data/local/palm_farm_dao.dart';
import 'package:palmfarm/data/local/type_convert.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'palm_farm_database.g.dart';

@Database(version: 1, entities: [PalmFarmDevice, PrivateSetting])
@TypeConverters([DateTimeConverter])
abstract class AppDatabase extends FloorDatabase {
  PalmFarmDAO get palmFarmDao;
}
