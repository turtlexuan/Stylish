import 'package:stylish/model/product_item.dart';

import '../util/network_manager.dart';

class ProductListService {
  NetworkManager networkManager = NetworkManager();

  int manProductPaging = 0;
  int womanProductPaging = 0;
  int accessoryProductPaging = 0;

  Future<List<Product>> fetchProductList() async {
    Map<String, dynamic> response =
        await networkManager.getRequest("/products/all");
    final List productData = response["data"];
    return productData.map((item) => Product.fromJson(item)).toList();
  }

  Future<List<Product>> fetchManProductList() async {
    if (manProductPaging == -1) {
      return [];
    }
    Map<String, dynamic> response = await networkManager.getRequest(
        "/products/men",
        queryParameters: {"paging": manProductPaging});
    final List productData = response["data"];
    final int? nextPage = response["next_paging"];
    manProductPaging = nextPage ?? -1;
    return productData.map((item) => Product.fromJson(item)).toList();
  }

  Future<List<Product>> fetchWomanProductList() async {
    if (womanProductPaging == -1) {
      return [];
    }
    Map<String, dynamic> response = await networkManager.getRequest(
        "/products/women",
        queryParameters: {"paging": womanProductPaging});
    final List productData = response["data"];
    final int? nextPage = response["next_paging"];
    womanProductPaging = nextPage ?? -1;
    return productData.map((item) => Product.fromJson(item)).toList();
  }

  Future<List<Product>> fetchAccessoryList() async {
    if (accessoryProductPaging == -1) {
      return [];
    }
    Map<String, dynamic> response = await networkManager.getRequest(
        "/products/accessories",
        queryParameters: {"paging": accessoryProductPaging});
    final List productData = response["data"];
    final int? nextPage = response["next_paging"];
    accessoryProductPaging = nextPage ?? -1;
    return productData.map((item) => Product.fromJson(item)).toList();
  }
}
