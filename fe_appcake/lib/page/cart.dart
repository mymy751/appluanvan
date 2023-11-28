import 'package:flutter/material.dart';
import 'package:futterhocviec/common/app_colors.dart';
import 'package:futterhocviec/page/detail-product.dart';
import 'package:futterhocviec/page/order.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cakeList = [];

  @override
  void initState() {
    cakeList = [
      {"name": "Banh 1", "count": 0},
      {"name": "Banh 2", "count": 0},
      {"name": "Banh 3", "count": 0},
      {"name": "Banh 4", "count": 0},
    ];
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
                      )
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
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cakeList.length,
                  itemBuilder: (context, index){
                    var item = cakeList[index];

                    return Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct()));
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
                                    image: AssetImage("assets/images/cake5.jpg")
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
                                         Text(item["name"], style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
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
                                                      if(item["count"]>0){
                                                        item["count"]--;
                                                      }
                                                    });
                                                  },
                                                  child: Icon(Icons.remove_circle_rounded),
                                                ),
                                                Text('${item["count"]}'),
                                                InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      item["count"]++;
                                                    });
                                                  },
                                                  child: Icon(Icons.add_circle_rounded)
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
