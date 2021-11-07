import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/entity/course.dart';
import 'package:mobile_trabalho/fetch/CoursesApi.dart';
import 'package:mobile_trabalho/ui/CourseList/courseCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// TODO https://www.youtube.com/watch?v=EwHMSxSWIvQ
// TODO tem como colocar propriedades opcionais? / Reaprovietar essa lista para  lista de curso por categoria
// https://stackoverflow.com/questions/54444474/make-function-parameter-optional-in-custom-widget-flutter

class CourseList extends StatefulWidget {
  final String? categoryId;

  const CourseList({
    Key? key,
    this.categoryId,
  }) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final CoursesApi coursesApi = new CoursesApi();
  late Future<List<Course>> _courses;

  @override
  void initState() {
    super.initState();
    _courses = coursesApi.fetchAllCourses(widget.categoryId);
  }

  Future<void> _pullRefresh() async {
    List<Course> freshFutureCourses =
        await coursesApi.fetchAllCourses(widget.categoryId);
    setState(() {
      _courses = Future.value(freshFutureCourses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _courses,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
                child: Center(
              child: Text(AppLocalizations.of(context)!.loading),
            ));
          } else {
            return RefreshIndicator(
              onRefresh: _pullRefresh,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return CourseCard(
                    course: snapshot.data[index],
                  );
                },
              ),
            );
          }
        });
  }
}
