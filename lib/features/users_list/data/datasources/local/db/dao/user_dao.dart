import 'package:drift/drift.dart';
import 'package:user_directory_app/core/db/app_database.dart';

import '../tables/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserTable])
class UserDAO extends DatabaseAccessor<AppDatabase> with _$UserDAOMixin {
  UserDAO(super.db);

  Future<List<User>> getAllUsers() => select(userTable).get();
  Future<List<User>> getAllUsersWithPage(int page, int limitPerPage) =>
      (select(userTable)
            ..limit(limitPerPage, offset: page * limitPerPage)
            ..orderBy([(t) => OrderingTerm.asc(t.id)]))
          .get();
  Future<User?> getUserById(int id) {
    return (select(userTable)
      ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertOrUpdateUser(Insertable<User> user) =>
      into(userTable).insertOnConflictUpdate(user);

  Future<int> deleteUser(int id) =>
      (delete(userTable)..where((tbl) => tbl.id.equals(id))).go();
}
