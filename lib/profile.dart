import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_kamp/AboutUs.dart';
import 'package:food_kamp/feedback.dart';
import 'login.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Devansh Sahu',
              style: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 5.0,),
              Text('9876543210',  style: TextStyle(color: Colors.grey
              ),),
            ],
          ),
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/IMAGES/coffee-and-tea-shops.png'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 40.0
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.feedback_rounded, color: Colors.amberAccent[400], size: 30.0,),
                  SizedBox(width: 10.0,),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedBack()),
                    );
                  },
                      child:  Text('Feedback and Suggestions', style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),),
                  ),

                ],),
              Divider(height: 30.0,color: Colors.grey[400],thickness: 1.2,),
              Row(
                children: [
                  Icon(Icons.emoji_food_beverage, color: Colors.blueAccent[200], size: 30.0,),
                  SizedBox(width: 10.0,),
                  TextButton( onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                    child: Text('About Us', style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  ),
                ],),
              Divider(height: 30.0,color: Colors.grey[400],thickness: 1.2,),
              Row(
                children: [
                  Icon(Icons.logout, color: Colors.pinkAccent[400], size: 30.0,),
                  SizedBox(width: 10.0,),
                  TextButton(onPressed: ()
                    async {
                       await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },

                    child: Text('Logout', style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                  ),
                ],),
              Divider(height: 30.0,color: Colors.grey[400],thickness: 1.2,),
            ],
          ),
        ),
      ),

    );
  }
}







