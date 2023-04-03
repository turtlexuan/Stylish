
class HighlihgtItem {
  final String imageUrl;
  final String name;

  HighlihgtItem({required this.imageUrl, required this.name});

  factory HighlihgtItem.fromJson(Map<String, dynamic> data) {
    final imageUrl = data["imgUrl"] as String;
    final name = data["name"] 
    as String;
    return HighlihgtItem(imageUrl: imageUrl, name: name);
  }
}
