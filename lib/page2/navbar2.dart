import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_kamp/page2/cart.dart';
import 'favourites.dart';
import 'menu.dart';
class NavBar2 extends StatefulWidget {
  @override
  _NavBar2State createState() => _NavBar2State();
}

class _NavBar2State extends State<NavBar2> {
  int _currentIndex = 0;
  final List<Widget> _children = [Menu(),FoodOrderPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 38.0,
        elevation: 5,
        selectedItemColor: Colors.black,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_rounded),
            title: Text('Menu'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart')
          )
        ],
      ),
    );

  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}