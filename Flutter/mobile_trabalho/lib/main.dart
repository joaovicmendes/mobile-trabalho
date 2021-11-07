import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/database.dart';

import 'ui/mainActivity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      db: await $FloorAppDatabase.databaseBuilder('app_database.db').build(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.db}) : super(key: key);
  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Aplicação', db: db),
    );
  }
}
