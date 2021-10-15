import 'package:flutter/material.dart';
import 'package:mobile_trabalho/ui/CategoryList/categoryGrid.dart';
import 'package:mobile_trabalho/ui/CourseList/courseCard.dart';
import 'package:mobile_trabalho/ui/CourseList/courseList.dart';
import 'package:mobile_trabalho/ui/UserPage/userPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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

  Widget navigator(){
    if(_selectedIndex == 1){
      return CategoryGrid();
    }else if(_selectedIndex == 2){
      return UserPage();
    }else{
      return CourseList();
    }
  }
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: navigator(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início', //index 0
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca', //index 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil', //index 2
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        ),
    );
  }
}
