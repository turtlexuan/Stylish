
import 'package:stylish/model/item.dart';

class CategoryItem {
  final String name;
  final List<Item> items;
  CategoryItem({ required this.name, required this.items });

  factory CategoryItem.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    var itemsData = data["items"] as List;
    List<Item> items = itemsData.map((data) => Item.fromJson(data)).toList();
    return CategoryItem(name: name, items: items);
  }
}