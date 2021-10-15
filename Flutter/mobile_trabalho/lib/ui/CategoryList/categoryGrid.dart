import 'package:flutter/material.dart';
import 'package:mobile_trabalho/fetch/CategoryApi.dart';
import 'package:mobile_trabalho/ui/CategoryList/categoryCard.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  CategoriesApi categoriesApi = new CategoriesApi();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categoriesApi.fetchAllCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.data == null){
            return Container(
                child: Center(
              child: Text("Loading..."),
            ));
          }else{
            return GridView.builder(
          itemCount: snapshot.data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CategoryCard(category: snapshot.data[index],);
          });
          }
    });
  }
}
