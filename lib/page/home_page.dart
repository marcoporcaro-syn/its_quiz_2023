import 'package:flutter/material.dart';
import 'package:its_quiz_2023/page/category_page.dart';

import 'question_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Benvenuto!"),
              const Text("Prima di iniziare scegli una categoria"),
              ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryPage()));
                    setState(() {
                      category = result;
                    });
                  },
                  child: Text(category.isEmpty ? "Scegli una categoria" : "Cambia categoria")),
              if (category.isNotEmpty) Text("Categoria scelta: $category"),
              if (category.isNotEmpty)
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuestionPage(category: category))
                      );
                    },
                    child: const Text("Inizia"))
            ],
          ),
        ),
      ),
    );
  }
}
