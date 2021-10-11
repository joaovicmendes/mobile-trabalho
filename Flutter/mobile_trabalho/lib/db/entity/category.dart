import 'package:floor/floor.dart';

@entity
class Category {
  @primaryKey
  final String id;

  final String name;
  final String
      hexColor; // Hex value of the color to be displayed in the search tab

  Category(this.id, this.name, this.hexColor);
}
