import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us',style: TextStyle(
                  color: Colors.white,
              ),
          ),
          backgroundColor: Colors.black,
        ),
    );
  }
}