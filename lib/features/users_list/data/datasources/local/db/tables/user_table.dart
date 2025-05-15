import 'package:drift/drift.dart';

@DataClassName("User")
class UserTable extends Table {
  IntColumn get id => integer()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get avatar => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
