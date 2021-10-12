import 'package:flutter/material.dart';
import 'package:mobile_trabalho/ui/CourseList/courseCard.dart';


// TODO https://www.youtube.com/watch?v=EwHMSxSWIvQ



class CourseList extends StatefulWidget {
  final List<CourseListCard> items;
  

  const CourseList({ Key? key, required this.items }) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        final item = widget.items[index];
        return Container(
          child: Column(children: [
            item.buildCourseHeader(context),
            item.buildCourseInstructor(context),
          ],),
        );
      }, 
     
      
      );
  }
}