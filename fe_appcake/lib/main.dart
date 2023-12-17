
import 'package:flutter/material.dart';
import 'package:futterhocviec/page/cart.dart';
// import 'package:futterhocviec/page/carts.dart';
import 'package:futterhocviec/page/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
//   final Future<List<Product>> product;
//   const MyApp({required this.product, super.key});
  const MyApp({ super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


