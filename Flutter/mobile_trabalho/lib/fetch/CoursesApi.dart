import 'package:mobile_trabalho/db/entity/category.dart';
import 'package:mobile_trabalho/db/entity/course.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_trabalho/db/entity/user.dart';
import 'dart:convert';

class CoursesApi {
  Future<List<Course>> fetchAllCourses([String? category]) async {
    var url;

    if (category != null) {
      url = Uri.parse(
          "https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/categories/$category/courses");
    } else {
      url = Uri.parse(
          "https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/courses/");
    }

    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    List<Course> courses2Return = [];

    for (var c in jsonData) {
      User instructor = User(c["instructor"]["id"], c["instructor"]["name"],
          c["instructor"]["username"], c["instructor"]["email"]);

      Category category = Category(c["category"]["id"], c["category"]["name"],
          c["category"]["hexColor"]);

      Course course = Course(c["id"], c["title"], c["description"], c["rating"],
          c["schedule"], c["videoUrl"], c["thumbnail"], category, instructor);

      courses2Return.add(course);
    }

    print(courses2Return.length);

    return courses2Return;
  }

  Future<Course> fetchById(String id) async {
    var url = Uri.parse(
        "https://us-central1-mobile-trabalho-api.cloudfunctions.net/api/courses/$id");

    var data = await http.get(url);

    var jsonData = json.decode(data.body);

    User instructor = User(
        jsonData["instructor"]["id"],
        jsonData["instructor"]["name"],
        jsonData["instructor"]["username"],
        jsonData["instructor"]["email"]);

    Category category = Category(jsonData["category"]["id"],
        jsonData["category"]["name"], jsonData["category"]["hexColor"]);

    Course course = Course(
        jsonData["id"],
        jsonData["title"],
        jsonData["description"],
        jsonData["rating"],
        jsonData["schedule"],
        jsonData["videoUrl"],
        jsonData["thumbnail"],
        category,
        instructor);

    return course;
  }

  CoursesApi();
}
