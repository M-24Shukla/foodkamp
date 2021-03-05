import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_kamp/page2/order_confirmation.dart';
import 'package:food_kamp/utility/cart_items.dart';
import 'package:food_kamp/utility/order_list.dart';
import 'package:food_kamp/utility/total_item_list.dart';
import 'package:provider/provider.dart';

class FoodOrderPage extends StatefulWidget {
  @override
  _FoodOrderPageState createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  @override
  Widget build(BuildContext context) {
    List<CartItem> items = [];
    Provider.of<OrderList>(context, listen: false).orders.forEach((key, value) {
     if (value.qty > 0) {
       items.add(CartItem(productName: key,
           productPrice: value.price,
           productImage: 'th (16)',
           productCartQuantity: value.qty.toString()));

     }
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF3a3737),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Center(
            child: Text(
              "Item Carts",
              style: TextStyle(
                  color: Color(0xFF3a3737),
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
          brightness: Brightness.light,
          actions: <Widget>[
            CartIconWithBadge(counter: 15,),
          ],
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 5, bottom: 10, top: 10),
                  child: Text(
                    "Your Food Cart",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
                Column(children: items,),
                SizedBox(height: 10,),
                PromoCodeWidget(),
                TotalCalculationWidget(),

                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Payment Method",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConfirmation()));
                  },
                  child: Text("Confirm Order", style: TextStyle(fontSize: 20,)),
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50.0,
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ));
  }
}



class TotalCalculationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
          child: Column(
            children: [
              Column(
                children: Provider.of<OrderList>(context, listen: false).total_item_bill,
              ),
              TotalItemList(name: "Total", price: Provider.of<OrderList>(context, listen: false).totalBill,)
            ],
          ),
        ),
      ),
    );
  }
}


class PromoCodeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: TextFormField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
                  borderRadius: BorderRadius.circular(7)),
              fillColor: Colors.white,

              hintText: 'Add Your Promo Code',
              filled: true,

              // Coupon selection
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.local_offer,
                    color: Color(0xFFfd2c2c),
                  ),
                  onPressed: () {
                    debugPrint('222');
                  })),
        ),
      ),
    );
  }
}


class CartIconWithBadge extends StatelessWidget {

  final int counter;
  CartIconWithBadge({this.counter});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.business_center,
              color: Color(0xFF3a3737),
              size: 39,
            ),
            onPressed: () {}),
        counter != 0
            ? Positioned(
          right: 4,
          top: 11,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.black45,
                width: 1
              )
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              '$counter',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
            : Container()
      ],
    );
  }
}

