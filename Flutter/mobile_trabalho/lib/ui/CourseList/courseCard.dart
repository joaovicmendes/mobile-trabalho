import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/entity/course.dart';
import 'package:mobile_trabalho/ui/CourseDetails/courseDetails.dart';

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard({ Key? key, required this.course }) : super(key: key);

  @override
  _CourseCardState createState() => _CourseCardState();
}

// TODO: visual do cartão do curso na lista
// TODO: Roteamento pra pagina de detalhes do curso (usar de base o feito do cartão de categoria pra lista de curso)


class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.course.title),
      onTap:(){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=> Scaffold(
                      appBar: AppBar(
                        title: Text(widget.course.title),
                      ),
                      body: CourseDetails(),
                    )  ),
                  );
                }, 
    );
  }
}