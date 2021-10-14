
import 'package:mobile_trabalho/entity/course.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CoursesApi{

  Future<List<Course>>  fetchAllCourses() async{


    var url = Uri.parse("https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/courses/");

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

  CoursesApi();


  



}