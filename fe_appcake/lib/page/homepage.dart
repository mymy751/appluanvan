import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futterhocviec/api/api.dart';
import 'package:futterhocviec/api/product.dart';
import 'package:futterhocviec/common/app_colors.dart';
import 'package:futterhocviec/page/cart.dart';
import 'package:futterhocviec/page/detail-product.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> cakeList;
  var _currPageValue = 0.0;

  final _textClear = TextEditingController();

  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    cakeList = fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundApp,
        body: SingleChildScrollView(
          child: Column(
              children: [
                //===================================THANH TIM KIEM========================//
                Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: TextField(
                                controller: _textClear,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                  hintText: 'Search Cake',
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25),

                                  ),
                                  suffixIcon: Container(
                                    width: 80,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                        onPressed: (){
                                          _textClear.clear();
                                        },
                                        icon: Icon(Icons.clear, color: Colors.black,),
                                      ),
                                        Icon(Icons.search_rounded, color: Colors.black,),
                      ]
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 45,
                              width: 45,
                              child: Container(
                                child:
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                                    },
                                    child: Icon(Icons.shopping_cart_outlined)
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.boxColor,
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),

                //===============================PAGEVIEW - 2CAI BOX============================//
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                    height: 300,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct()));
                      },
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: 5,
                          itemBuilder: (context, position) {
                            return Stack(
                              children: [
                                Container(
                                  height: 220,
                                  margin: EdgeInsets.only(right: 10, left: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/cake5.jpg"
                                          )
                                      )
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 120,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors.box2Color,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('NameCake', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                          SizedBox(height: 5),
                                          Text( "Price"),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                      ),
                    ),
                  ),
                // ),

                //===================================LISTVIEW=====================================//
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (content, position){
                        return Card(
                          child: Container(
                            margin: EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct()));
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.blue,
                                      image:DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/cake5.jpg"
                                        )
                                      )
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight:Radius.circular(20),
                                      ),
                                      // color: Colors.pink,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20, right: 10, top: 2),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('NameCake', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                                          SizedBox(height: 5),
                                          Text( "Price"),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 2),
                                              width: 90,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: AppColors.boxColor,
                                              ),
                                              child: Center(child: Text("Add to Cart", style: TextStyle(fontSize: 16),)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
              ]
          ),
        ),
      ),
    );
  }


  List<Product> parseProduct(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> fetchProduct() async {
   final response = await http.get(Uri.parse('http://192.168.2.185:4000/api/getAllProduct'));
    //final response = await http.get(Uri.parse('https:192.168.56.2/api/getAllProduct'));
    print('===response: ' );
    print(response.body);
    if(response.statusCode == 200){
      return parseProduct(response.body);
    } else {
      throw Exception('Unable to fetch product from the REST API');
    }
  }
}
