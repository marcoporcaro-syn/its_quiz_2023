import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              onCategorySelected(context, "Musica");
            },
            child: Text("Musica")),
        ElevatedButton(
            onPressed: () {
              onCategorySelected(context, "Film");
            },
            child: Text("Film")),
        ElevatedButton(
            onPressed: () {
              onCategorySelected(context, "Natura");
            },
            child: Text("Natura")),
      ],
    ));
  }

  onCategorySelected(BuildContext context, String category) {
    Navigator.pop(context, category);
  }
}
