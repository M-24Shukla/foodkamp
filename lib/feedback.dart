import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback and Suggestions'
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
            color: Colors.grey[200],
        child: Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Text('How was your experience with us',style: TextStyle(
                    color: Colors.white,backgroundColor: Colors.black
                  ),),
                )
              ],
              ),
            )
          ],
        ),
          ));

  }
}
