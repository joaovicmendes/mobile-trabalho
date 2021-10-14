

// resolver problema disso ai https://floor.codes/entities/
import 'package:mobile_trabalho/entity/category.dart';
import 'package:mobile_trabalho/entity/user.dart';


class Course {
 
  final String id;

  final String title;
  final String description;
  final int rating;
  final String schedule;
  final String videoUrl;
  final String thumbnail;
  // final Category category;
  // final User instructor;

  Course(
    this.id, 
    this.title, 
    this.description, 
    this.rating, 
    this.schedule,
    this.videoUrl, 
    this.thumbnail, 
    // this.category, 
    // this.instructor
  );
}
