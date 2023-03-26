
import 'package:stylish/model/cat.dart';

class CategoryItem {
  final String name;
  final List<Cat> cats;
  CategoryItem({ required this.name, required this.cats });

  factory CategoryItem.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    var catsData = data["cats"] as List;
    List<Cat> cats = catsData.map((data) => Cat.fromJson(data)).toList();
    return CategoryItem(name: name, cats: cats);
  }
}