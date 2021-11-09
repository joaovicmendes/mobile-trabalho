import 'package:flutter/material.dart';
import 'package:mobile_trabalho/fetch/CoursesApi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'courseDetailsPage.dart';


class CourseDetails extends StatefulWidget {

  final String courseId;
  const CourseDetails({Key? key, required this.courseId}) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final CoursesApi coursesApi = new CoursesApi();
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: coursesApi.fetchById(widget.courseId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
                child: Center(
              child: Text(AppLocalizations.of(context)!.loading),
            ));
          } else {
            return CourseDetailsPage(course: snapshot.data,);
          }
        }
      );
  }
}


