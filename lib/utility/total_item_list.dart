import 'package:flutter/material.dart';

class TotalItemList extends StatelessWidget {

  final String name, price;
  TotalItemList({this.price, this.name});
  @override
  Widget build(BuildContext context) {
    bool isTotal = (name == "Total");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                fontSize: isTotal ? 22 : 18,
                color: isTotal ? Colors.black : Color(0xFF3a3a3b),
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          Text(
            "₹ $price",
            style: TextStyle(
                fontSize: isTotal ? 22 : 18,
                color: isTotal ? Colors.black : Color(0xFF3a3a3b),
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w400),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}