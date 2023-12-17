
import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
        icon: Icon(Icons.menu, color: Colors.black, size: 30),
          onPressed: () {
          // Mở drawer khi người dùng nhấn vào biểu tượng menu
          Scaffold.of(context).openDrawer();
        },
          ),
    );
  }
}
