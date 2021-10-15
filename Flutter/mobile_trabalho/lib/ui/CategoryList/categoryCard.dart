import 'package:flutter/material.dart';
import 'package:mobile_trabalho/db/entity/category.dart';
import 'package:mobile_trabalho/ui/CourseList/courseList.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({ Key? key, required this.category }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}
//TODO adicionar onTap
//TODO visual

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
              child: InkWell(
                child: Text(widget.category.name),
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=> Scaffold(
                      appBar: AppBar(
                        title: Text(widget.category.name),
                      ),
                      body: CourseList(categoryId: widget.category.id,),
                    )  ),
                  );
                },
              ) 
              
              
            );
  }
}