import 'package:floor/floor.dart';
import 'package:mobile_trabalho/db/entity/category.dart';

@dao
abstract class CategoryDao {
  @Query("SELECT * FROM Category")
  Future<List<Category>> getAll();

  @Query("SELECT * FROM Category WHERE id == :id")
  Future<Category?> findCategoryById(String id);

  @insert
  Future<void> insertCategory(Category category);
}
