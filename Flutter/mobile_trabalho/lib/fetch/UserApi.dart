import 'package:mobile_trabalho/db/database.dart';
import 'package:mobile_trabalho/db/entity/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersApi {
  //TODO trocar o url pro certo

  Future<User> fetchById(String id) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final userDao = database.userDao;

    var result = await userDao.findUserById(id);

    if (result == null) {
      // print("Getting user");
      var url = Uri.parse(
          "https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/users/$id");

      var data = await http.get(url);

      var jsonData = json.decode(data.body);

      result = User(jsonData["userId"], jsonData["name"], jsonData["email"],
          jsonData["username"]);
    }

    return result;
  }

  UsersApi();
}
