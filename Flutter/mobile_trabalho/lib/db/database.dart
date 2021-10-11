// Baseado no package https://floor.codes/getting-started/


import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/userDao.dart';
import 'entity/user.dart';

import 'dao/categoryDao.dart';
import 'entity/category.dart';

import 'dao/courseDao.dart';
import 'entity/course.dart';


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Course,User,Category])
abstract class AppDatabase extends FloorDatabase {
  CourseDao get courseDao;
  UserDao get userDao;
  CategoryDao get categoryDao;
}