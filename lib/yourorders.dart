import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_kamp/ordernow.dart';
import 'package:getwidget/getwidget.dart';
class YourOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            // IconButton(onPressed: (){return OrderNow();},icon: Icon(Icons.arrow_back),
            // color: Colors.white, iconSize: 33.0,),
          Text('Your orders',style: TextStyle(
            color: Colors.white,
            fontSize: 24.0
          ),)
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 14.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Orders',style: TextStyle(
                    fontSize: 27.0,color: Colors.black,fontWeight: FontWeight.w500,
                  ),),
                  Column(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading:   GFAvatar(
                               backgroundImage:AssetImage('assets/IMAGES/th (15).png'),
                                  shape: GFAvatarShape.standard
                               ),
                              title: Text(
                                'Tea Post',
                                style: TextStyle(fontSize: 22.0,color: Colors.grey[700],fontWeight: FontWeight.bold,),
                              ),
                                subtitle: Text('Tea,Coffee,Fast food,Beverages',style: TextStyle(color: Colors.grey[600],),),
                              // trailing: IconButton(icon: Icon(Icons.qr_code,color: Colors.black,), onPressed: (){},),
                            ),
                            Divider(height:0,thickness: 1,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('Reach till 21:00',style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 15),),
                                    ],
                                  ),
                                  TextButton(onPressed: (){},child: Text('View QR',style: TextStyle(
                                  color: Colors.redAccent,fontWeight: FontWeight.bold,),textAlign: TextAlign.start,),),
                                  TextButton(onPressed: (){},child: Text('View Order',style: TextStyle(
                                    color: Colors.redAccent,fontWeight: FontWeight.bold,),textAlign: TextAlign.start,),),
                               ],
                              ),
                            )
                             ],
                             )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Past Orders',style: TextStyle(
                    fontSize: 27.0,color: Colors.grey[800],fontWeight: FontWeight.w500,
                  ),),
                  Column(
                    children: [
                      Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading:   GFAvatar(
                                    backgroundImage:AssetImage('assets/IMAGES/th (15).png'),
                                    shape: GFAvatarShape.standard
                                ),
                                title: Text(
                                  'Tea Post',
                                  style: TextStyle(fontSize: 22.0,color: Colors.grey[700],fontWeight: FontWeight.bold,),
                                ),
                                subtitle: Text('Tea,Coffee,Fast food,Beverages',style: TextStyle(color: Colors.grey[600],),),
                                // trailing: IconButton(icon: Icon(Icons.qr_code,color: Colors.black,), onPressed: (){},),
                              ),
                              Divider(height:0,thickness: 1,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Ordered at',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                                        Text('31 Jan 2021 at 21:20',style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold,fontSize: 15),),
                                      ],
                                    ),
                                    TextButton(onPressed: (){},child: Text('View Order',style: TextStyle(
                                      color: Colors.redAccent,fontWeight: FontWeight.bold,),textAlign: TextAlign.start,),),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),

        ),
      ),

    );
  }
}
