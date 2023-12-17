// import 'package:futterhocviec/api/product.dart';
//
// class CartProduct {
//   int id_cart;
//   int total_amount;
//   int quality;
//   int id_product;
//   String product_name;
//   String product_image;
//   String product_price;
//
//
//   CartProduct(this.id_cart, this.total_amount, this.quality, this.id_product,
//       this.product_name, this.product_image, this.product_price);
//
//   factory CartProduct.fromJson(Map<String, dynamic> data){
//     return CartProduct (
//       data['id_cart'] ?? 0,
//       data['total_amount'] ?? 0,
//       data['quality'] ?? 0,
//       data['id_product'] ?? 0,
//       data['product_name'] ?? "",
//       data['product_image'] ?? "",
//       data['product_price'] ?? "",
//
//     );
//   }
//
//   // Phương thức để tăng số lượng sản phẩm
//   // void increment() {
//   //   count++;
//   // }
//   //
//   // // Phương thức để giảm số lượng sản phẩm
//   // void decrement() {
//   //   if (count > 0) {
//   //     count--;
//   //   }
//   // }
// }

import 'dart:convert';

import 'package:futterhocviec/api/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem extends Product {
  int quantity;

  CartItem(
    int id_product,
    String productName,
    String productImage,
    String productPrice,
    String productCategory,
    num productDiameter,
    num productHeight,
    String productDescription,
      this.quantity) : super(id_product, productName, productImage, productPrice, productCategory, productDiameter, productHeight, productDescription);

  increase(){
    quantity++;
  }
  decrease(){
    if(quantity >0){
      quantity--;
    }
  }

  getProductDetail() {
    return Product(id_product, productName, productImage, productPrice, productCategory, productDiameter, productHeight, productDescription);
  }
}

Cart cachedCart = Cart([]);

class Cart {
  List<CartItem> listCartItems;

  Cart(this.listCartItems);

  Future<void> syncCartItemsToStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert from JSON to string
    final String stringifiedCartItems = listCartItems.toString();

    await prefs.setString('cart', stringifiedCartItems);
  }

  Future<void> add(Product product) async {
    var cartItem = getById(product.id_product);

    if (cartItem != null) {
      cartItem.increase();
    } else {
      listCartItems.add(
          CartItem(
              product.id_product,
              product.productName,
              product.productImage,
              product.productPrice,
              product.productCategory,
              product.productDiameter,
              product.productHeight,
              product.productDescription,
              1
          )
      );
    }


    await syncCartItemsToStorage();
  }

  CartItem getById(int id) {
    final CartItem cartItem = listCartItems.firstWhere((cartItem) => cartItem.id_product == id);

    return cartItem;
  }

  List<CartItem> listCart() {
    return listCartItems;
  }

  int countTotal() {
    return listCartItems.length;
  }

  Future<void> remove(int id) async {
    final CartItem cartItem = getById(id);

    await syncCartItemsToStorage();

    listCartItems.remove(cartItem);
  }

  Future<void> increaseById(int id) async {
    final CartItem item = getById(id);

    await syncCartItemsToStorage();

    item.increase();
  }

  Future<void> decreaseById(int id) async {
    final CartItem item = getById(id);

    await syncCartItemsToStorage();

    item.decrease();
  }

  // Ensuring others will use the same instance Cart
  // Singleton pattern in DesignPattern
  static Future<Cart> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get cartItems from the "local storage" or shared preferences
    final String? stringifiedCartItems = prefs.getString('cart');

    // Convert from string to Object using json.decode
    final List<CartItem> cartItems = stringifiedCartItems != null ? json.decode(stringifiedCartItems) : [];

    cachedCart = Cart(cartItems);

    return cachedCart;
  }
}
