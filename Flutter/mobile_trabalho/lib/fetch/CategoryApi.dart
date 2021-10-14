
import 'package:mobile_trabalho/db/entity/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CategorysApi{

  Future<List<Category>>  fetchAllCategorys() async{


    var url = Uri.parse("https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/categories/");

    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    List<Category> categorys2Return = [];

    for (var c in jsonData) {
      
      Category category = Category(c["id"],c["name"],c["hexcolor"]);

      categorys2Return.add(category);


    }

    print(categorys2Return.length);

    return categorys2Return;

  }



  Future<Category> fetchById(String id) async{


    var url = Uri.parse("https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/categories/$id");

    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    Category category = Category(jsonData["id"],jsonData["name"],jsonData["hexcolor"]);

    return category;
  }


  CategorysApi();


  



}