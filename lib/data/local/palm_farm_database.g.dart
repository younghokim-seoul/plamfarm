// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_farm_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PalmFarmDAO? _palmFarmDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PalmFarmDevice` (`macAddress` TEXT NOT NULL, `name` TEXT NOT NULL, `createdAt` INTEGER NOT NULL, PRIMARY KEY (`macAddress`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PalmFarmDAO get palmFarmDao {
    return _palmFarmDaoInstance ??= _$PalmFarmDAO(database, changeListener);
  }
}

class _$PalmFarmDAO extends PalmFarmDAO {
  _$PalmFarmDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _palmFarmDeviceInsertionAdapter = InsertionAdapter(
            database,
            'PalmFarmDevice',
            (PalmFarmDevice item) => <String, Object?>{
                  'macAddress': item.macAddress,
                  'name': item.name,
                  'createdAt': _dateTimeConverter.encode(item.createdAt)
                },
            changeListener),
        _palmFarmDeviceDeletionAdapter = DeletionAdapter(
            database,
            'PalmFarmDevice',
            ['macAddress'],
            (PalmFarmDevice item) => <String, Object?>{
                  'macAddress': item.macAddress,
                  'name': item.name,
                  'createdAt': _dateTimeConverter.encode(item.createdAt)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PalmFarmDevice> _palmFarmDeviceInsertionAdapter;

  final DeletionAdapter<PalmFarmDevice> _palmFarmDeviceDeletionAdapter;

  @override
  Stream<List<PalmFarmDevice>> findAllPalmFarmDevicesAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM PalmFarmDevice ORDER BY createdAt',
        mapper: (Map<String, Object?> row) => PalmFarmDevice(
            row['macAddress'] as String,
            row['name'] as String,
            _dateTimeConverter.decode(row['createdAt'] as int)),
        queryableName: 'PalmFarmDevice',
        isView: false);
  }

  @override
  Future<void> insertPalmFarmDevice(PalmFarmDevice model) async {
    await _palmFarmDeviceInsertionAdapter.insert(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePalmFarmDevice(PalmFarmDevice model) async {
    await _palmFarmDeviceDeletionAdapter.delete(model);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
