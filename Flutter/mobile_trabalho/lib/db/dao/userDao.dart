import 'package:floor/floor.dart';
import 'package:mobile_trabalho/db/entity/user.dart';

@dao
abstract class UserDao {
  @Query("SELECT * FROM User")
  Future<List<User>> getAll();

  @Query("SELECT * FROM User WHERE id == :id")
  Future<User?> findUserById(String id);

  @insert
  Future<void> insertUser(User user);
}
