import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/entity/category.dart';
import 'package:mobile_trabalho/ui/CourseList/courseList.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}
//TODO adicionar onTap
//TODO visual

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(_getColorFromHex(widget.category.hexColor)),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: InkWell(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                widget.category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(widget.category.name),
                        ),
                        body: CourseList(
                          categoryId: widget.category.id,
                        ),
                      )),
            );
          },
        ));
  }

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
