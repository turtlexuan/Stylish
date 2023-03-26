import 'dart:ffi';

class Cat {
  final String name;
  final int age;
  final String imageUrl;
  Cat({ required this.name, required this.age, required this.imageUrl });

  factory Cat.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final age = data["age"] as int;
    final imageUrl = data["imgUrl"] as String;
    return Cat(name: name, age: age, imageUrl: imageUrl);
  }
}