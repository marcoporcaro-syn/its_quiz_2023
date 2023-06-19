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
        child: Column(
          children: [
            const Text("Benvenuto!"),
            const Text("Prima di iniziare scegli una categoria"),
            ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CategoryPage())
                  );
                  setState(() {
                    category = result;
                  });
                },
                child: const Text("Scegli categoria")
            ),
            Text("Categoria scelta: $category"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionPage()));
                },
                child: const Text("Inizia"))
          ],
        ),
      ),
    );
  }
}
