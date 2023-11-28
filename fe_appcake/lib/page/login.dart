import 'package:flutter/material.dart';
import 'package:futterhocviec/common/app_colors.dart';
import 'package:futterhocviec/page/homepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundApp,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo hoặc hình ảnh đại diện
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage("assets/images/logo1.jpg")
                   )
                ),
              ),
              SizedBox(height: 16.0),
              // Ô nhập email
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  )
                ),
              ),
              SizedBox(height: 16.0),
              // Ô nhập mật khẩu
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  )
                ),
              ),
              SizedBox(height: 16.0),
              // Nút đăng nhập
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Đăng Nhập',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
