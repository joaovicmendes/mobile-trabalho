

// resolver problema disso ai https://floor.codes/entities/
import 'package:mobile_trabalho/db/entity/category.dart';
import 'package:mobile_trabalho/db/entity/user.dart';


class Course {
 
  String id;

  String title;
  String description;
  int rating;
  String schedule;
  String videoUrl;
  String thumbnail;
  final Category category;
  final User instructor;

  Course(
    this.id, 
    this.title, 
    this.description, 
    this.rating, 
    this.schedule,
    this.videoUrl, 
    this.thumbnail, 
    this.category, 
    this.instructor
  );
}
