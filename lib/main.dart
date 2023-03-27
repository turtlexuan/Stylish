import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:stylish/model/category_item.dart';
import 'package:stylish/model/highlight_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CategoryItem currentCategory = CategoryItem(
    cats: [],
    name: '',
  );
  List<HighlihgtItem> highlightItems = [];
  List<CategoryItem> categorieItems = [];

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readHighlihgtItem();
    readCategoryItem();
  }

  Future<void> readHighlihgtItem() async {
    final String jsonString =
        await rootBundle.loadString('assets/highlight_items.json');
    final List data = await json.decode(jsonString)["highlights"];
    final highlights =
        data.map((item) => HighlihgtItem.fromJson(item)).toList();
    // ...
    setState(() {
      highlightItems = highlights;
    });
  }

  Future<void> readCategoryItem() async {
    final String jsonString =
        await rootBundle.loadString('assets/main_page_items.json');
    final List data = await json.decode(jsonString)["categories"];
    final categories = data.map((item) => CategoryItem.fromJson(item)).toList();
    // ...
    setState(() {
      categorieItems = categories;
      currentCategory = categories.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: highlightItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          highlightItems[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
            DropdownButton<CategoryItem>(
              value: currentCategory,
              items: categorieItems.map<DropdownMenuItem<CategoryItem>>((CategoryItem value) {
                return DropdownMenuItem<CategoryItem>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: (CategoryItem? value) {
                setState(() {
                  currentCategory = value!;
                });
              },
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: currentCategory.cats.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  height: 80,
                  child: Row(children: [
                    Image.network(currentCategory.cats[index].imageUrl),
                    Column(children: [
                      Text(currentCategory.cats[index].name),
                      Text("Age: ${currentCategory.cats[index].age}"),
                    ],)
                  ]),
                );
            })
          ],
        ));
  }
}
