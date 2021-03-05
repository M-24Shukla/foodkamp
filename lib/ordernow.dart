import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_kamp/page2/menu.dart';
//import 'package:food_kamp/utility/total_items.dart';
import 'package:provider/provider.dart';


class OrderNow extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  return Scaffold(

    appBar: AppBar(
      toolbarHeight: 210.0,
      flexibleSpace: Image(
        image: AssetImage('assets/IMAGES/Group 286.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    body: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('ORDER NOW',style: TextStyle(
                      fontSize: 27.0,color: Colors.blueGrey[700],fontWeight: FontWeight.bold,
          ),),
         SizedBox(height: 8.0,),
         InkWell(
           child: Card(
             elevation: 5.0,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
             clipBehavior: Clip.antiAlias,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Image.asset('assets/IMAGES/th (15).png',height: 141,fit: BoxFit.fitWidth,),
               ListTile(
               title: Text(
                   'Tea Post',
                   style: TextStyle(fontSize: 22.0,color: Colors.grey[700],fontWeight: FontWeight.bold,),
               ),
               subtitle: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Tea,Coffee,Fast food,Beverages',style: TextStyle(color: Colors.grey[600],),),
                   Row(
                     children: [
                       Text('Open Now',style: TextStyle(color: Colors.lightGreenAccent[400], fontWeight: FontWeight.bold),),
                       SizedBox(width: 18.0,),
                       Text('9:00 - 21:00',style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                     ],
                   )
                 ],
               ),
               )
               ],
             ),
           ),
           onTap: (){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Menu()),
             );
           },
         ),
          ],
        ),
      ),
    ),
  );
}
}
