import 'package:flutter/material.dart';
import 'package:its_quiz_2023/data/category_repository.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Scegli una categoria")),
        body: FutureBuilder<List<String>>(
          future: CategoryRepository().getCategories(),
          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            final categories = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(onPressed: () => onCategorySelected(context, categories[index]), child: Text(categories[index]));
                  }),
            );
          },
        ));
  }

  onCategorySelected(BuildContext context, String category) {
    CategoryRepository().saveCategory(category).then((value) {
      Navigator.pop(context, category);
    });
  }


}
