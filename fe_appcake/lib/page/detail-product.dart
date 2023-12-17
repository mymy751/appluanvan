import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futterhocviec/api/cart.dart';
import 'package:futterhocviec/api/product.dart';
import 'package:futterhocviec/common/app_colors.dart';
import 'package:futterhocviec/page/cart.dart';

class DetailProduct extends StatefulWidget {
  final Product product;
  const DetailProduct({super.key, required this.product});


  @override
  State<DetailProduct> createState() => _DetailProductState();
}
class _DetailProductState extends State<DetailProduct> {

  // List<CartProduct> cart = [];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundApp,
          body: Stack(
            children: [
              //=========================IMAGE===============================//
              Positioned(
                left: 0, right: 0,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.network(
                      widget.product.productImage,
                      fit: BoxFit.cover,
                    ),
                  )
              ),
              //==========================ICONS=============================//
              Positioned(
                top: 25,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.box2Color,
                          ),
                          child: Icon(Icons.arrow_back_rounded),
                        ),
                      ),

                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PageCart()));
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.box2Color,
                        ),
                        child: Icon(Icons.shopping_cart_outlined,),
                      ),
                    )
                  ],
                ),
              ),
              //===========================OPTIONS===========================//
              Positioned(
                  left: 0, right: 0, bottom: 0, top: 260,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundApp,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 24,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text( "Options",
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 24, right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 24),
                                  child: Row(
                                    children: [
                                      Text( "Chieu cao: ",
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: 120,
                                        height: 30,
                                        child: TextField(
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                              hintText: widget.product.productHeight.toString(),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: BorderSide(width: 1, color: Colors.white24)
                                              )
                                          ),

                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 24),
                                  child: Row(
                                    children: [
                                      Text( "Duong  kinh: ",
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: 120,
                                        height: 30,
                                        child: TextField(
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                              hintText: widget.product.productDiameter.toString(),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide: BorderSide(width: 1, color: Colors.white24)
                                              )
                                          ),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text("Mo ta: ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text("Mot tram hat mua khong hat mua nao roi "
                                    "nham cho, gap mot tram nguoi khong nguoi nao "
                                    "la ngau nhien. Kiep truoc ngoai dau 500 lan "
                                    "doi lai kiep nay mot lan gap go.", textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ),
          //==========================BOTTOM CART=============================//
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
            height: 130,
            decoration: const BoxDecoration(
              color: AppColors.colorBottom,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text( "Gia: ",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.boxColor,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove_circle_rounded),
                      SizedBox(width: 5,),
                      Text("0"),
                      SizedBox(width: 5,),
                      Icon(Icons.add_circle_rounded),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.boxColor,
                  ),
                  child: Text("Add Cart"),
                ),
              ],
            ),
          ),
        )
    );
  }
}
