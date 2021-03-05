import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'ordernow.dart';
import 'profile.dart';
import 'yourorders.dart';
/*void main() {
  runApp(MaterialApp(
    home: NavBar(),
  ));
}*/
class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [OrderNow(),YourOrders(),Profile()];
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
            icon: Icon(Icons.shopping_bag),
            title: Text('Order now'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
            title: Text('Your orders'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
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









