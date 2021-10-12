import 'package:flutter/material.dart';

abstract class CourseListCard {
  Widget buildCourseHeader(BuildContext context);
  Widget buildCourseInstructor(BuildContext context);
  Widget buildCourseReview(BuildContext context);
}

class CourseCard implements CourseListCard {
  final String header;
  final String instructor;

  CourseCard(this.header,this.instructor);

  @override
  Widget buildCourseHeader(BuildContext context) {
    return Text(
      header,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildCourseReview(BuildContext context) {
    return Text(
      header,
      
    );
  }

  @override
  Widget buildCourseInstructor(BuildContext context) {
    return Text(
      header,
      
    );
  }
}
