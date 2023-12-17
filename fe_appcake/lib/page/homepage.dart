import 'package:flutter/material.dart';
import 'package:futterhocviec/api/api.dart';
import 'package:futterhocviec/api/cart.dart';
import 'package:futterhocviec/api/category.dart';
import 'package:futterhocviec/api/product.dart';
import 'package:futterhocviec/api/productoutstanding.dart';
import 'package:futterhocviec/common/app_colors.dart';
import 'package:futterhocviec/page/cart.dart';
import 'package:futterhocviec/page/dashboard.dart';
import 'package:futterhocviec/page/detail-product.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textClear = TextEditingController();
  PageController pageController = PageController(viewportFraction: 0.85);

  late Future <List<Product>> cakeList;
  late Future <List<Product>> fillterProduct;

  late Future <List<Category>> categoryList;

  // List<CartProduct> cart = [];

  late Future <List<ProductOutstanding>> listProductOutstanding;

  String _selected = "";

   late Future<Cart> futureCart;

  @override
  void initState() {
    futureCart = Cart.initialize();
    super.initState();
    cakeList = fetchProduct();
    categoryList = fetchCategory();

    listProductOutstanding = fetchProductOutstanding();
  }
  void searchProducts (String query){
    print(query);
    setState(() {
      if(query.isEmpty){
        cakeList = fetchProduct();
      }else {
        cakeList = fetchfillterListProduct(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundApp,
        //============================IN DASHBOARD===========================//
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Align(child: Text('Danh mục sản phẩm', style: TextStyle(fontSize: 24),)),
                decoration: BoxDecoration(
                  color: AppColors.appbarColor,
                ),
              ),
              FutureBuilder<List<Category>>(
                future: categoryList,
                builder: (context, snapshot){
                  if(snapshot.hasData) {
                    List<Category> categories = snapshot.data ?? [];
                    if (categories.isEmpty){
                      return Container();
                    }
                    else {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index){
                          var category = categories[index];
                          return ListTile(
                            title: Text(category.categoryName, style: TextStyle(fontSize: 20),),
                            onTap: () {
                              // cakeList = fetchfillterListProduct(_selected);
                              setState(() {
                                _selected = category.categoryName;
                                print("Selected category: $_selected");
                                cakeList = fetchfillterListCategory(_selected);
                                print("Cake list: $cakeList");
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                      searchProducts("");
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
                    child: Text("All Product", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  ))
            ],
          ),
        ),
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
                          //====================DASHBOARD=====================//
                          Dashboard(),
                          
                          SizedBox(width: 5,),
                          Expanded(
                            child: Center(
                              child: TextField(
                                onChanged: (value){
                                  searchProducts(value);
                                },
                                controller: _textClear,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                  hintText: 'Search Cake',
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
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
                                          searchProducts("");
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PageCart()));
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
                FutureBuilder<List<ProductOutstanding>> (
                  future: listProductOutstanding,
                  builder: (BuildContext context, index) {
                    if(index.hasData) {
                      List<ProductOutstanding> prodOutstanding = index.data ?? [];
                      if (prodOutstanding.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 35),
                          child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: AppColors.boxColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(child: Text("Chua Co Du lieu!",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 24),))
                          ),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          height: 300,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct(product: )));
                            },
                            child: PageView.builder(
                                controller: pageController,
                                itemCount: prodOutstanding.length,
                                itemBuilder: (context, index) {
                                  ProductOutstanding pOutstanding = prodOutstanding[index];

                                  return Stack(
                                    children: [
                                      Container(
                                        height: 220,
                                        margin: EdgeInsets.only(right: 10, left: 5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.network(
                                            width: 300,
                                            height: 220,
                                            fit: BoxFit.cover,
                                            pOutstanding.productImage
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 120,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                30),
                                            color: AppColors.box2Color,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Column(
                                              children: [
                                                Text('NameCake',
                                                  style: TextStyle(fontSize: 20,
                                                    fontWeight: FontWeight
                                                        .w600,),),
                                                SizedBox(height: 5),
                                                Text("Price"),
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
                        );
                      }
                    }
                    else if(index.hasError){
                      return Text('${index.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),

                //===================================LISTVIEW=====================================//
                FutureBuilder<List<Product>>(
                  future: cakeList,
                  builder: (BuildContext context, snapshot){
                    if (snapshot.hasData) {
                      List<Product> products = snapshot.data ?? [];
                      if(products.isEmpty){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 35),
                          child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: AppColors.boxColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text("Chua Co Du lieu!", style: TextStyle(color: Colors.red, fontSize: 24),))
                          ),
                        );
                      } else {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: products.length,
                          itemBuilder: (content, index) {
                            Product product = products[index];
                            print(product);
                            return SingleChildScrollView(
                              child: Card(
                                child: Container(
                                  margin: EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                              DetailProduct(product: product)));
                                        },
                                        child: Container(
                                          width: 120,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Image.network(
                                              fit: BoxFit.cover,
                                              product.productImage,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            // color: Colors.pink,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 10, top: 2),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(product.productName,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight
                                                          .w600),),
                                                Text(product.productPrice),
                                                SizedBox(height: 5),
                                                GestureDetector(
                                                  onTap: () async {
                                                    Cart cart = await futureCart;
                                                    print("$cart");
                                                    cart.add(product);
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                              PageCart()));
                                                    // FutureBuilder<Cart>(
                                                    //   future: futureCart,
                                                    //   builder: (context, index){
                                                    //     Cart? cart = index.data;
                                                    //     if(cart != null){
                                                    //       cart.add(product);
                                                    //       Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                    //           PageCart()));
                                                    //     }
                                                    //     return const CircularProgressIndicator();
                                                    //   },
                                                    // );
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      width: 120,
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                        color: AppColors.boxColor,
                                                      ),
                                                      child: Center(child: Text(
                                                        "Add to Cart",
                                                        style: TextStyle(
                                                            fontSize: 16, fontWeight: FontWeight.w500),)
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // FutureBuilder<Cart>(
                                                //   future: futureCart,
                                                //   builder: (context, index){
                                                //     if(index.hasData){
                                                //       Cart? cart = index.data;
                                                //       if(cart != null){
                                                //         return GestureDetector(
                                                //           onTap: () async {
                                                //             await cart.add(product);
                                                //             print("cart.listCartItems, ${cart.listCartItems}");
                                                //             Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                //                 PageCart()));
                                                //           },
                                                //           child: Align(
                                                //             alignment: Alignment.centerRight,
                                                //             child: Container(
                                                //               width: 120,
                                                //               height: 35,
                                                //               decoration: BoxDecoration(
                                                //                 borderRadius: BorderRadius.circular(5),
                                                //                 color: AppColors.boxColor,
                                                //               ),
                                                //               child: Center(child: Text(
                                                //                 "Add to Cart",
                                                //                 style: TextStyle(
                                                //                     fontSize: 16, fontWeight: FontWeight.w500),)
                                                //               ),
                                                //             ),
                                                //           ),
                                                //         );
                                                //       }
                                                //     }
                                                //     return const CircularProgressIndicator();
                                                //   },
                                                // )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
            //     ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: products.length,
            //   itemBuilder: (content, index) {
            //     Product product = products[index];
            //     print(product.productImage);
            //     return SingleChildScrollView(
            //       child: Card(
            //         child: Container(
            //           margin: EdgeInsets.all(6.0),
            //           child: Row(
            //             children: [
            //               InkWell(
            //                 onTap: () {
            //                   Navigator.push(context, MaterialPageRoute(builder: (context) =>
            //                       DetailProduct(product: product)));
            //                 },
            //                 child: Container(
            //                   width: 120,
            //                   height: 100,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(30),
            //                   ),
            //                   child: Image.network(
            //                     fit: BoxFit.cover,
            //                     product.productImage,
            //                   ),
            //                 ),
            //               ),
            //
            //               Expanded(
            //                 child: Container(
            //                   height: 100,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.only(
            //                       topRight: Radius.circular(20),
            //                       bottomRight: Radius.circular(20),
            //                     ),
            //                     // color: Colors.pink,
            //                   ),
            //                   child: Padding(
            //                     padding: EdgeInsets.only(
            //                         left: 20, right: 10, top: 2),
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment
            //                           .start,
            //                       mainAxisAlignment: MainAxisAlignment
            //                           .center,
            //                       children: [
            //                         Text(product.productName,
            //                           style: TextStyle(
            //                               fontSize: 20,
            //                               fontWeight: FontWeight
            //                                   .w600),),
            //                         Text(product.productPrice),
            //                         SizedBox(height: 5),
            //                         GestureDetector(
            //                           onTap: (){
            //                             setState(() {
            //                               // CartProduct data = CartProduct(0, 0, 0, 0, "", "", "");
            //                               // cart.add(data);
            //                               // AddCart(product);
            //                             });
            //                             Navigator.push(context, MaterialPageRoute(builder: (context) => PageCart()));
            //                           },
            //                           child: Align(
            //                             alignment: Alignment.centerRight,
            //                             child: Container(
            //                               width: 120,
            //                               height: 35,
            //                               decoration: BoxDecoration(
            //                                 borderRadius: BorderRadius.circular(5),
            //                                 color: AppColors.boxColor,
            //                               ),
            //                               child: Center(child: Text(
            //                                 "Add to Cart",
            //                                 style: TextStyle(
            //                                     fontSize: 16, fontWeight: FontWeight.w500),)
            //                               ),
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
              ]
          ),
        ),
      ),
    );
  }
}
