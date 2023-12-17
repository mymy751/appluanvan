import 'dart:convert';
import 'package:futterhocviec/api/cart.dart';
import 'package:futterhocviec/api/category.dart';
import 'package:futterhocviec/api/product.dart';
import 'package:futterhocviec/api/productoutstanding.dart';
import 'package:futterhocviec/common/constants.dart';
import 'package:futterhocviec/page/cart.dart';
import 'package:http/http.dart' as http;

List<Product> parseProduct(String responseBody){
  final parsed = json.decode(utf8.decode(responseBody.codeUnits)).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> fetchProduct() async {
  // final response = await http.get(Uri.parse('http://192.168.2.185:4000/api/getAllProduct'));
  // final response = await http.get(Uri.parse('http://10.60.10.222:4000/api/getAllProduct'));
  // final response = await http.get(Uri.parse('http://10.60.10.222:4000/api/getAllProduct'));
  final response = await http.get(Uri.parse('$apiUrl/api/getAllProduct'), headers: {"a": "1", "b":"2"},);
  print('===response: ' );
  print(response.body);
  if(response.statusCode == 200){
    return parseProduct(response.body);
  } else {
    throw Exception('Unable to fetch product from the REST API');
  }
}

List<Product>parsefillterListProducts(String query) {
  final parsed = json.decode(query).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
Future<List<Product>> fetchfillterListProduct(String query) async {
  // final response = await http.get(Uri.parse('http://192.168.2.185:4000/api/getAllProduct'));
  // final response = await http.get(Uri.parse('http://10.60.10.222:4000/api/getAllProduct'));
  final response = await http.get(Uri.parse('$apiUrl/api/getAllProductByName?queryName='+ query));
  print('===responseeeeeeeeees: ');
  print(response.body);
  if(response.statusCode == 200){
    return parsefillterListProducts(response.body);
  } else {
    throw Exception('Unable to fetch product by name from the REST API');
  }
}
//================================CATEGORY==================================//
List<Category> parseCategory(String responseBody){
  final parsed = json.decode(utf8.decode(responseBody.codeUnits)).cast<Map<String, dynamic>>();
  return parsed.map<Category>((json) => Category.fromJson(json)).toList();
}

Future<List<Category>> fetchCategory() async {
  final response = await http.get(Uri.parse('$apiUrl/api/getAllCategory'));
  print('===response: ' );
  print(response.body);
  if(response.statusCode == 200){
    return parseCategory(response.body);
  } else {
    throw Exception('Unable to fetch product from the REST API');
  }
}

List<Product>parsefillterListCategory(String query) {
  final parsed = json.decode(utf8.decode(query.codeUnits)).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
Future<List<Product>> fetchfillterListCategory(String query) async {
  final response = await http.get(Uri.parse('$apiUrl/api/getAllCategoryByName?queryName='+query));
  print('===responseeeeeeeeee: ');
  print(response.body);
  if(response.statusCode == 200){
    return parsefillterListCategory(response.body);
  } else {
    throw Exception('Unable to fetch product by name from the REST API');
  }
}

List<ProductOutstanding> parseProductOutstanding(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ProductOutstanding>((json) => ProductOutstanding.fromJson(json)).toList();
}

Future<List<ProductOutstanding>> fetchProductOutstanding() async {
  // final response = await http.get(Uri.parse('http://192.168.2.185:4000/api/getAllProduct'));
  // final response = await http.get(Uri.parse('http://10.60.10.222:4000/api/getAllProduct'));
  // final response = await http.get(Uri.parse('http://10.60.10.222:4000/api/getAllProduct'));
  final response = await http.get(
      Uri.parse('$apiUrl/api/getAllProductOutstanding'));
  print('===response: ');
  print(response.body);
  if (response.statusCode == 200) {
    return parseProductOutstanding(response.body);
  } else {
    throw Exception('Unable to fetch product from the REST API');
  }
}

//================================CART=======================================//

// List<CartProduct> parseCart(String query) {
//   final parsed = json.decode(utf8.decode(query.codeUnits)).cast<Map<String, dynamic>>();
//   return parsed.map<CartProduct>((json) => CartProduct.fromJson(json)).toList();
// }
//
// Future<List<CartProduct>> fetchCart() async {
//   final response = await http.get(Uri.parse('$apiUrl/api/getAddToCart'));
//   if (response.statusCode == 200) {
//     return parseCart(response.body);
//   } else {
//     throw Exception('Unable to fetch cart items from the REST API');
//   }
// }
//
//
// List<CartProduct> parseAddCart(String query) {
//   final parsed = json.decode(utf8.decode(query.codeUnits)).cast<Map<String, dynamic>>();
//   return parsed.map<CartProduct>((json) => CartProduct.fromJson(json)).toList();
// }
//
// Future<List<CartProduct>> AddCart(Product product) async {
//   String product_name = product.productName;
//
//
//   final response = await http.post(Uri.parse('$apiUrl/api/add-to-cart'), headers: <String, String>{
//     'Content-Type': 'application/json; charset=UTF-8',
//   },body: jsonEncode(<String, String>{
//     "total_amount": '1', "quality": '1', "product_name": product_name,
//     "product_image": "product.productImage", "product_price": "product.productPrice"
//   }));
//   if (response.statusCode == 200) {
//     return parseCart(response.body);
//   } else {
//     throw Exception('Unable to fetch cart items from the REST API');
//   }
// }
