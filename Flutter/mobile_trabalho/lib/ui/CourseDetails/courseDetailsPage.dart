import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_trabalho/db/entity/course.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetailsPage extends StatefulWidget {
  final Course course;

  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            // Course image and Course Headers
            height: 150,

            child: Row(
              children: [
                Container(
                  color: Colors.blue,
                  width: 150,
                  height: 150,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.course.title,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          widget.course.instructor.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            //Course Description

            child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.course_details_description,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Expanded(child: Text(widget.course.description)),
                ],
              ),
            ),
          ),
          ElevatedButton(
              //Schedule Button
              onPressed: () {},
              child: Container(
                width: 100,
                height: 50,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.course_details_schedule,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
