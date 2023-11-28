import 'dart:convert';
import 'package:futterhocviec/api/product.dart';
import 'package:http/http.dart' as http;

List<Product> parseProduct(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> fetchProduct() async {
  final response = await http.get(Uri.parse('http://172.21.0.194:3000/api/getAllProduct'));
  print('===response: $response' );
  if(response.statusCode == 200){
    return parseProduct(response.body);
  } else {
    throw Exception('Unable to fetch product from the REST API');
  }
}

