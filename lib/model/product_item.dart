class Product {
  int id;
  String category;
  String title;
  String description;
  double price;
  String texture;
  String wash;
  String place;
  String note;
  String story;
  List<Color> colors;
  List<String> sizes;
  List<Variant> variants;
  String mainImage;
  List<String> images;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.mainImage,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var colorsJson = json['colors'] as List;
    List<Color> colors =
        colorsJson.map((colorJson) => Color.fromJson(colorJson)).toList();

    var variantsJson = json['variants'] as List;
    List<Variant> variants = variantsJson
        .map((variantJson) => Variant.fromJson(variantJson))
        .toList();

    return Product(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      texture: json['texture'],
      wash: json['wash'],
      place: json['place'],
      note: json['note'],
      story: json['story'],
      colors: colors,
      sizes: List<String>.from(json['sizes']),
      variants: variants,
      mainImage: json['main_image'],
      images: List<String>.from(json['images']),
    );
  }
}

class Color {
  String code;
  String name;

  Color({
    required this.code,
    required this.name,
  });

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      code: json['code'],
      name: json['name'],
    );
  }
}

class Variant {
  String colorCode;
  String size;
  int stock;

  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }
}
