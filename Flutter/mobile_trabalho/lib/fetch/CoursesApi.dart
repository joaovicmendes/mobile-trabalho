
import 'package:mobile_trabalho/db/entity/course.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CoursesApi{

  Future<List<Course>>  fetchAllCourses([String? category]) async{
    var url;

    if(category != null){
      url = Uri.parse("https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/categories/$category/courses");
    }else{
      url = Uri.parse("https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/courses/");
    }

    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    List<Course> courses2Return = [];

    for (var c in jsonData) {
      
      Course course = Course(c["id"],c["title"],c["description"],c["rating"],c["schedule"],c["videoUrl"],c["thumbnail"]);

      courses2Return.add(course);


    }

    print(courses2Return.length);

    return courses2Return;

  }



  Future<Course> fetchById(String id) async{


    var url = Uri.parse("https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/courses/$id");

    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    Course course = Course(jsonData["id"],jsonData["title"],jsonData["description"],jsonData["rating"],jsonData["schedule"],jsonData["videoUrl"],jsonData["thumbnail"]);

    return course;
  }


  CoursesApi();


  



}