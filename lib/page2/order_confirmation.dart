import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_kamp/utility/order_list.dart';
import 'package:food_kamp/utility/total_item_list.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderConfirmation extends StatelessWidget {
  @override
  String orderN = "Order Number : ";
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(62),
      width: double.infinity,
      height: double.infinity-1000,
      color: Color(0xff801e17),
      foregroundDecoration: null,
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xfff2b8c4),
      ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.0,),
            QrImage(data: "222", size: 280.0),
            SizedBox(height: 10,),
            Text("${orderN.toUpperCase()} 222", style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
            ),),
            SizedBox(height: 10,),
            Text(
              "SHOW THIS SCREEN TO THE CASHIER ONCE YOU REACH!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none
                )
            ),
            SizedBox(height: 35,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "ORDER SUMMARY",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none
                      )
                    ),
                    TotalCalculationWidget(),
                  ],
                ),
              ),
            ),
            SizedBox(height : 10),
            Text(
              "Promo-code applied : None",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none
              )
            ),
            SizedBox(height : 10),
            Text(
                "Timestamp : 21:00 | 11th March",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none
                )
            ),
            SizedBox(height : 10),
            Text(
                "Payment Mode : Card",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none
                )
            ),
            SizedBox(height : 50),
            Text(
              "Enjoy your meal!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.black,

                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none
              )
            )
          ],),
      ),
    );
  }
}

class TotalCalculationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.all(1),
      alignment: Alignment.center,
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: SingleChildScrollView(
//          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
          child: Column(
            children: Provider.of<OrderList>(context).total_item_bill,
          ),
        ),
      ),
    );
  }
}
