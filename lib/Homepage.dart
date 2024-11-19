import 'package:coffeeshop/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'pages/cart_page.dart';
import 'pages/shop_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  void naviagteBottomBar(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  final List<Widget> _pages = [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => naviagteBottomBar(index),
      ),
      body: _pages[selectedindex],
    );
  }
}
