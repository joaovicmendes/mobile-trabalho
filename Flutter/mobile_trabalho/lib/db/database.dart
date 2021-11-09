import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:mobile_trabalho/db/dao/categoryDao.dart';
import 'package:mobile_trabalho/db/entity/category.dart';
import 'package:mobile_trabalho/db/dao/userDao.dart';
import 'package:mobile_trabalho/db/entity/user.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Category, User])
abstract class AppDatabase extends FloorDatabase {
  CategoryDao get categoryDao;
  UserDao get userDao;
}
