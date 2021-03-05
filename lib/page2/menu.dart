import 'dart:collection';
import 'package:food_kamp/utility/order_list.dart';
//import 'package:food_kamp/utility/total_items.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_kamp/tools/countview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart.dart';

bool isAvailable = true, isOpen = true, isNew = true, anyOrder = false;
int totalOrders = 0;
HashSet<String> types;
Map<String, int> mp = new Map();

final _firestore = FirebaseFirestore.instance;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       leadingWidth: 0,
       toolbarHeight: 242,
       flexibleSpace: Card(
         margin: EdgeInsets.zero,
         elevation: 0.0,
         clipBehavior: Clip.antiAlias,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Image.asset('assets/IMAGES/th (15).png',fit: BoxFit.fitWidth,),
             ListTile(
               title: Text(
                 'Tea Post',
                 style: TextStyle(fontSize: 22.0,color: Colors.grey[700],fontWeight: FontWeight.bold,),
               ),
               subtitle: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 10,),
                   Text('Tea, Coffee, Fast food, Beverages',style: TextStyle(color: Colors.grey[600],),),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Text(isOpen ? 'Open Now' : 'Closed',style: TextStyle(color: isOpen ? Colors.lightGreenAccent[400] : Colors.red, fontWeight: FontWeight.bold),),
                       SizedBox(width: 18.0,),
                       Text('9:00 - 21:00',style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                     ],
                   )
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Menu',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.blueGrey[800]),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: _firestore.collection('mayank').orderBy("type").snapshots(),
                              builder:(context, snapshot) {
                                  List<MenuItem> items = [];
                                  if (!snapshot.hasData) {
                                      return Container();
                                  }
                                  final item_in_db =snapshot.data.docs;
                                  String prev = "";
                                  for (var item in item_in_db) {
                                    String name = item['name'];
                                    mp[name] = 0;
                                    String price = (item['price']);
                                    Provider.of<OrderList>(context, listen: false).orders[name] = new PriceAndQt(qty: 0, price: price);

                                    String type = item['type'];
                                    bool isAvailable = item['available'];
                                    if (prev != type) isNew = true;
                                    prev = type;
                                    items.add(MenuItem(name: name, price: price, isAvailable: isAvailable, newItem: isNew, type: type.toUpperCase(),));
                                    if (isNew) isNew = false;

                                  }
                                  return SizedBox(
                                    child: Column(
                                      children: items,
                                    ),
                                  );
                              }
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10, top: 160),
            child: FloatingActionButton(
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(
                    Icons.shopping_cart,
                    size: 39,
                    ),
                    onPressed: () {
                      Provider.of<OrderList>(context, listen: false).updateTotalList();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodOrderPage()));
                    }),
                  Positioned(
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
                        Provider.of<OrderList>(context, listen: false).getTotal,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodOrderPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final bool isAvailable, newItem;
  final String name, type;
  final String price;
  MenuItem({@required this.isAvailable, @required this.name, @required this.price, this.newItem, this.type});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.arrow_right,size: 42,color: Colors.black,),
      title: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.newItem) ...[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black87,
                  width: 3
                ),
                borderRadius: BorderRadius.circular(2.0)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                    widget.type,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: TextStyle(
                    fontWeight: FontWeight.w800,fontSize: 20,color: Colors.black87
                  ),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('₹ ${widget.price.toString()}',style: TextStyle(
                        color: Colors.grey[400],fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),),
                      Text(widget.isAvailable ? 'Available Now' : 'Unavailable',style: TextStyle(
                          color: widget.isAvailable ? Colors.lightGreen[400] : Colors.red,fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ],
                  ),
                ],
              ),
              CountButtonView(
                initialCount: 0,
                onChange: (count) {

                  mp[widget.name] = count;

                  Provider.of<OrderList>(context, listen: false).orders[widget.name].qty = count;
                  int t = 0;
                  mp.forEach((key, value) {
                    t += value;
                  });
                  print(t);
                  Provider.of<OrderList>(context, listen: false).modifyTotal(t);
                },
              )
            ],
          ),
        ],
      ),

    ) ;
  }
}