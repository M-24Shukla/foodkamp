import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_kamp/utility/order_list.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'main2.dart'; 

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => OrderList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: LoginPage(),
        home : StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index,sncpshot){
            if(sncpshot.hasData){
              return NavBar();
            }
            return LoginPage();
          }
        )
      ),
    );
  }
}

class TotalCount extends ChangeNotifier {
  int total = 0;
}