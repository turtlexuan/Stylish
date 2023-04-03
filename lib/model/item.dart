
class Item {
  final String name;
  final int age;
  final String imageUrl;
  Item({ required this.name, required this.age, required this.imageUrl });

  factory Item.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final age = data["age"] as int;
    final imageUrl = data["imgUrl"] as String;
    return Item(name: name, age: age, imageUrl: imageUrl);
  }
}