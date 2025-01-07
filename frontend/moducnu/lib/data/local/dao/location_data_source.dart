import 'package:moducnu/data/local/entity/location_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class LocationDataSource {
  Future<void> addLocation(LocationEntity building, String tableName);
  Future<List<LocationEntity>> getLocations(String tableName);
  Future<void> deleteLocation(int buildingId, String tableName);
  Future<void> clearLocations(String tableName);
  Future<bool> isLocationSaved(int buildingId, String tableName);
}

class LocationDataSourceImpl implements LocationDataSource {
  Database? _database;

  // 생성자에서 데이터베이스 초기화
  LocationDataSourceImpl() {
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    _database = await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'locations.db'),
      onCreate: (db, version) async {
        // 저장한 장소 테이블 생성
        await db.execute('''
          CREATE TABLE saved_locations (
            building_id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            node_id TEXT NOT NULL,
            alias TEXT NOT NULL,
            contact TEXT NULLABLE,
            category TEXT NULLABLE
          )
        ''');

        // 최근 방문한 장소 테이블 생성
        await db.execute('''
          CREATE TABLE recent_locations (
            building_id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            node_id TEXT NOT NULL,
            alias TEXT NOT NULL,
            contact TEXT NULLABLE,
            category TEXT NULLABLE
          )
        ''');
      },
      version: 1,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  @override
  Future<void> addLocation(LocationEntity building, String tableName) async {
    final db = await database;
    await db.insert(
      tableName,
      building.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<LocationEntity>> getLocations(String tableName) async {
    final db = await database;
    final maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return LocationEntity.fromMap(maps[i]);
    });
  }

  @override
  Future<void> deleteLocation(int buildingId, String tableName) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'building_id = ?',
      whereArgs: [buildingId],
    );
  }

  @override
  Future<void> clearLocations(String tableName) async {
    final db = await database;
    await db.delete(tableName);
  }

  @override
  Future<bool> isLocationSaved(int buildingId, String tableName) async {
    final db = await database;
    final maps = await db.query(
      tableName,
      where: 'building_id = ?',
      whereArgs: [buildingId],
    );
    return maps.isNotEmpty;
  }
}
