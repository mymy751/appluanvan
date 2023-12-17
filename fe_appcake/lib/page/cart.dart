import 'package:flutter/material.dart';
import 'package:futterhocviec/api/api.dart';
import 'package:futterhocviec/api/cart.dart';
import 'package:futterhocviec/common/app_colors.dart';
import 'package:futterhocviec/page/detail-product.dart';
import 'package:futterhocviec/page/order.dart';

class PageCart extends StatefulWidget {

  // final List<CartProduct> cart;
  PageCart({super.key});
  // const Cart({super.key,});

  // Future<Cart> futureCart = Cart.initialize();

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {

  late Future<Cart> futureCart;

  @override
  void initState() {
    futureCart =  Cart.initialize();
    // cartProduct = fetchCart();
    // cakeList = [
    //   {"name": "Banh 1", "count": 0},
    //   {"name": "Banh 2", "count": 0},
    //   {"name": "Banh 3", "count": 0},
    //   {"name": "Banh 4", "count": 0},
    // ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundApp,
          body: Column(
            children: [
              //=========================ICONBACK-GIOHANG=====================//
              Container(
                color: AppColors.appbarColor,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_rounded, color: Colors.black,),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text("Gio hang",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 0.5,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // Điều chỉnh vị trí của đổ bóng
                    ),
                  ],
                ),
              ),
              //===========================LISTVIEW==========================//
              // Expanded(
              //   child: Container(
              //     // height: 300,
              //     child: FutureBuilder<List<Cart>>(
              //       future: cart.listCartItems(),
              //       builder: (context, index){
              //         if(index.hasData ){
              //           List<cart> carts = index.data ?? [];
              //           if (carts.isEmpty) {
              //             return Padding(
              //               padding: const EdgeInsets.symmetric(
              //                   horizontal: 24.0, vertical: 35),
              //               child: Container(
              //                   height: 200,
              //                   decoration: BoxDecoration(
              //                     color: Colors.cyan,
              //                     borderRadius: BorderRadius.circular(40),
              //                   ),
              //                   child: Center(child: Text("Chua Co Du lieu!",
              //                     style: TextStyle(
              //                         color: Colors.red, fontSize: 24),))
              //               ),
              //             );
              //           } else {
              //             return ListView.builder(
              //                 itemCount: carts.length,
              //                 // itemCount: cartProduct.length,
              //                 itemBuilder: (context, index){
              //                   CartProduct products = carts[index];
              //                   return Card(
              //                     child: Container(
              //                       child: Row(
              //                         children: [
              //                           Container(
              //                             margin: EdgeInsets.all(6.0),
              //                             width: 120,
              //                             height: 120,
              //                             decoration: BoxDecoration(
              //                               borderRadius: BorderRadius.circular(30),
              //                               color: AppColors.boxColor,
              //                             ),
              //                             child: Image.network(
              //                                 fit: BoxFit.cover,
              //                                 // products.product!.productImage,
              //                                 products.product_image
              //                             ),
              //                           ),
              //                           Expanded(
              //                               child: Container(
              //                                 height: 120,
              //                                 decoration: BoxDecoration(
              //                                   borderRadius: BorderRadius.only(
              //                                     topRight: Radius.circular(20),
              //                                     bottomRight: Radius.circular(20),
              //                                   ),
              //                                   // color: Colors.pink,
              //                                 ),
              //                                 child: Row(
              //                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                                   children: [
              //                                     Column(
              //                                       crossAxisAlignment: CrossAxisAlignment.start,
              //                                       mainAxisAlignment: MainAxisAlignment.center,
              //                                       children: [
              //                                         // Text(products.product!.productName),
              //                                         Text(products.product_name),
              //                                         SizedBox(height: 5),
              //                                         // Text(products.product!.productPrice),
              //                                         Text(products.product_price as String),
              //                                       ],
              //                                     ),
              //                                     Row(
              //                                       // crossAxisAlignment: CrossAxisAlignment.end,
              //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                         children: [
              //                                           Column(
              //                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                                             crossAxisAlignment: CrossAxisAlignment.end,
              //                                             children: [
              //                                               InkWell(
              //                                                   onTap:(){
              //                                                     setState(() {
              //                                                       // cartProduct.remove(products);
              //                                                     });
              //                                                   },
              //                                                   child: Icon(Icons.delete)
              //                                               ),
              //                                               Container(
              //                                                 padding: EdgeInsets.all(6.0),
              //                                                 decoration: BoxDecoration(
              //                                                   borderRadius: BorderRadius.circular(10),
              //                                                   color: AppColors.boxColor,
              //                                                 ),
              //                                                 child: Row(
              //                                                   children: [
              //                                                     InkWell(
              //                                                         onTap: (){
              //                                                           setState(() {
              //                                                             if(products.quality>0){
              //                                                               products.quality --;
              //                                                             }
              //                                                           });
              //                                                         },
              //                                                         child: Icon(Icons.remove_circle_rounded)
              //                                                     ),
              //                                                     SizedBox(width: 5,),
              //                                                     Text("${products.quality}"),
              //                                                     SizedBox(width: 5,),
              //                                                     InkWell(
              //                                                         onTap:(){
              //                                                           setState(() {
              //                                                             products.quality ++;
              //                                                           });
              //                                                         },
              //                                                         child: Icon(Icons.add_circle_rounded)),
              //                                                   ],
              //                                                 ),
              //                                               ),
              //                                             ],
              //                                           )
              //                                         ]
              //                                     )
              //                                   ],
              //                                 ),
              //                               )
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   );
              //                 }
              //             );
              //           }
              //         }
              //         else if(index.hasError){
              //           return Text('${index.error}');
              //         }
              //         return const CircularProgressIndicator();
              //       },
              //
              //     ),
              //   ),
              // )

              FutureBuilder<Cart>(
                future: futureCart,
                builder: (context, index){
                  print("object");
                  if(index.hasData){
                    Cart? cart = index.data;
                    print("$cart");
                    if(cart == null){
                      return Container(
                        child: Center(
                          child: Text("Gio hang chua co san pharm",
                            style: TextStyle(color: Colors.red, fontSize: 24),
                          ),
                        ),
                      );
                    }
                    else {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cart.listCartItems.length,
                          itemBuilder: (context, index){
                            var item = cart.listCartItems[index];
                            return Card(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                      DetailProduct(product: item.getProductDetail(),))
                                  );
                                },
                                child: Align(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(6.0),
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: AppColors.boxColor,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  item.productImage,
                                                )
                                            )
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(right: 6.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(item.productName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                                                  Icon(Icons.delete),
                                                ],
                                              ),
                                              SizedBox(height: 20,),
                                              Text("Gia: ", style: TextStyle(fontSize: 16),),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: Container(
                                                  // margin: EdgeInsets.only(right: 6),
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                    color: AppColors.boxColor,
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.only(left: 8, right: 8),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: (){
                                                            setState(() {
                                                              item.decrease();
                                                            });
                                                          },
                                                          child: Icon(Icons.remove_circle_rounded),
                                                        ),
                                                        Text('${item.quantity}'),
                                                        InkWell(
                                                          onTap: (){
                                                            setState(() {
                                                              item.increase();
                                                            });
                                                          },
                                                          child: Icon(Icons.add_circle_rounded),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                  return const CircularProgressIndicator();

                },


              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: AppColors.appbarColor,
            ),
            height: 80,
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Tong tien: ", style: TextStyle(fontSize: 18),),
                      Text("2", style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Order()));
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.boxColor,
                      ),
                      child: Align(child: Text("Thanh Toan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
