import 'package:floor/floor.dart';
import 'package:mobile_trabalho/db/entity/category.dart';

@dao
abstract class CategoryDao{

  @Query('SELECT * FROM Category')
  Future<List<Category>> findAllCategory();

  @insert
  Future<void> insertCategory(Category user);


}