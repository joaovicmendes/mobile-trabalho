import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/entity/course.dart';

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard({ Key? key, required this.course }) : super(key: key);

  @override
  _CourseCardState createState() => _CourseCardState();
}

//TODO: visual do cartão do curso na lista


class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.course.title),

    );
  }
}