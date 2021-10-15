import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_trabalho/db/entity/course.dart';
import 'package:mobile_trabalho/ui/CourseDetails/courseDetails.dart';

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  _CourseCardState createState() => _CourseCardState();
}




class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(widget.course.title),
                      ),
                      body: CourseDetails(),
                    )),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            SizedBox(height: 5),

            Text(
              widget.course.title,
              
              style: const TextStyle(
                
                fontSize: 20.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 5),
            Text(
              widget.course.instructor.name,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 5),

            RatingBarIndicator(
              rating: widget.course.rating.toDouble(),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 12.0,
              direction: Axis.horizontal,
            ),
            SizedBox(height: 5),

          ],
        ),
      ),
    );
  }
}
