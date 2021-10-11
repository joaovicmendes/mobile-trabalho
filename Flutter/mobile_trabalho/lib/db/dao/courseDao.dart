import 'package:floor/floor.dart';
import 'package:mobile_trabalho/db/entity/course.dart';

@dao
abstract class CourseDao{

  @Query('SELECT * FROM Course')
  Future<List<Course>> findAllCourses();

  @Query('SELECT * FROM Course WHERE id = :id')
  Future<List<Course>> findAllCoursesById(String id);

  @Query('SELECT * FROM Course WHERE category = :category')
  Future<List<Course>> findAllCoursesByCategory(String category);

  @insert
  Future<void> insertCourse(Course user);


}