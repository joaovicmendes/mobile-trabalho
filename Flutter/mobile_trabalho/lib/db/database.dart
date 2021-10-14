import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:mobile_trabalho/db/dao/categoryDao.dart';
import 'package:mobile_trabalho/db/entity/category.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Category])
abstract class AppDatabase extends FloorDatabase {
  CategoryDao get categoryDao;
}