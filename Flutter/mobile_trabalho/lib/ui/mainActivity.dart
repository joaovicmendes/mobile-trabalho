import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/database.dart';
import 'package:mobile_trabalho/fetch/CategoryApi.dart';
import 'package:mobile_trabalho/ui/CategoryList/categoryGrid.dart';
import 'package:mobile_trabalho/ui/CourseList/courseList.dart';
import 'package:mobile_trabalho/ui/UserPage/userPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.db})
      : super(key: key);

  final String title;
  final AppDatabase db;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget navigator() {
    if (_selectedIndex == 1) {
      return CategoryGrid(db: widget.db);
    } else if (_selectedIndex == 2) {
      return UserPage();
    } else {
      return CourseList();
    }
  }

  @override
  Widget build(BuildContext context) {
    var homeText = AppLocalizations.of(context)!.bottonNavigationHome;
    var searchText = AppLocalizations.of(context)!.bottonNavigationSearch;
    var profileText = AppLocalizations.of(context)!.bottonNavigationProfile;
    fetchAndSaveCategories();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: navigator(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: homeText, //index 0
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: searchText, //index 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: profileText, //index 2
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  fetchAndSaveCategories() async {
    CategoriesApi categoriesApi = new CategoriesApi();
    var response = await categoriesApi.fetchAllCategories();
    response.forEach((category) {
      widget.db.categoryDao.insertCategory(category);
    });
  }
}
