import 'package:flutter/material.dart';
import 'package:mobile_trabalho/fetch/CoursesApi.dart';
import 'package:mobile_trabalho/ui/CourseList/courseCard.dart';

// TODO https://www.youtube.com/watch?v=EwHMSxSWIvQ
// TODO tem como colocar propriedades opcionais? / Reaprovietar essa lista para  lista de curso por categoria
// https://stackoverflow.com/questions/54444474/make-function-parameter-optional-in-custom-widget-flutter

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final CoursesApi coursesApi = new CoursesApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: coursesApi.fetchAllCourses(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
                child: Center(
              child: Text("Loading..."),
            ));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  course: snapshot.data[index],
                  );
              },
            );
          }
        });
  }
}
