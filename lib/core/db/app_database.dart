import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../../features/users_list/data/datasources/local/db/dao/user_dao.dart';
import '../../features/users_list/data/datasources/local/db/tables/user_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [UserTable], daos: [UserDAO])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.defaults() : super(driftDatabase(name: 'app_db'));

  @override
  int get schemaVersion => 1;
}
