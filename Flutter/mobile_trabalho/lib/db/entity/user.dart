import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;

  User(this.id, this.name, this.username, this.email, this.password);
}
