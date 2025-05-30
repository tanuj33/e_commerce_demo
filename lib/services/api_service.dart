import 'package:dio/dio.dart';
import 'package:e_commerce_demo/models/product_model.dart'; // Import the Product model

class ApiService {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://fakestoreapi.com';

  // Fetch a list of products
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get('$_baseUrl/products');
      if (response.statusCode == 200) {
        List<dynamic> productJson = response.data;
        return productJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to load products');
    }
  }
}
