

import 'package:floor/floor.dart';

@entity
class User {
  
  @primaryKey
  String id;
  
  String name;
  String username;
  String email;
  String? password;

  User(this.id, this.name, this.username, this.email, [this.password]);
}
