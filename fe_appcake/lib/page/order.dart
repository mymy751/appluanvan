// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:futterhocviec/common/app_colors.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundApp,
        body: Column(
          children: [
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
                      child: Text("Thanh toan",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      )
                  ),
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
            Container(
              margin: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dia chi nhan hang", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("O mot noi nao do cua vu tru nay", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 2,
                color: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 12, bottom: 12, right: 20),
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
                                          Text("Name Cake", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Text("Gia: ",
                                            style: TextStyle(fontSize: 16),)
                                    ]
                                  ),
                                ),
                              ),
                            ]
                          )
                      );
                    }
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.boxColor,
                  ),
                  onPressed: (){},
                  child: Text("Xac nhan", style: TextStyle(fontSize: 16),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
