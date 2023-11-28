// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futterhocviec/api/product.dart';
// import 'package:futterhocviec/api/product.dart';
import 'package:futterhocviec/page/homepage.dart';
import 'package:futterhocviec/page/login.dart';
// import 'package:http/http.dart' as http;

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
      home: Login(),
    );
  }
}


