import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:palmfarm/data/local/palm_farm_database.dart';
import 'package:palmfarm/injector.config.dart';


final getIt = GetIt.instance;

@injectableInit
void configureDependencies() =>  getIt.init();


void setupLocate() {
  getIt.registerSingletonAsync<AppDatabase>(() async =>$FloorAppDatabase.databaseBuilder('demo.db').build());
}
