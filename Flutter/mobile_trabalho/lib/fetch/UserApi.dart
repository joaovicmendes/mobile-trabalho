
import 'package:mobile_trabalho/db/entity/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UsersApi{

  


  //TODO trocar o url pro certo

  Future<User> fetchById(String id) async{


    var url = Uri.parse("https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/users/$id");

    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    User user = User(jsonData["id"],jsonData["name"],jsonData["email"],jsonData["username"],jsonData["password"]);

    return user;
  }


  UsersApi();


  



}