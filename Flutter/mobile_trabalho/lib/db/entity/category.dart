import 'package:floor/floor.dart';

@entity
class Category {
  @primaryKey
  String id;

  String name;
  String hexColor; // Hex value of the color to be displayed in the search tab

  Category(this.id, this.name, this.hexColor);
}
