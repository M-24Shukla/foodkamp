import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';
import 'main2.dart';
import 'otp.dart';

class SignUpPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const SignUpPage({Key key, this.hintText, this.obscureText, this.controller}) : super(key: key);
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loading=false;
  bool _obscureText=true;
  UserCredential userCredential;
  RegExp regExp =RegExp(SignUpPage.pattern);
  TextEditingController name=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController password=TextEditingController();
  GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();

  Future sendData()async{
    try {
  userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: mail.text,
    password: password.text,
  );

  await FirebaseFirestore.instance.collection('userData').doc(userCredential.user.uid).set({
    'Name': name.text.trim(),
    'Email': mail.text.trim(),
    'Password': password.text.trim(),
    'userid': userCredential.user.uid,
    /*'Phone': phonee.trim(),*/
  });
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
     globalKey.currentState.showSnackBar(SnackBar(content: Text('The password provided is too weak.'),),);
  } else if (e.code == 'email-already-in-use') {
    globalKey.currentState.showSnackBar(SnackBar(content: Text('The account already exists for that email.'),),);
  }
} catch (e) {
   globalKey.currentState.showSnackBar(SnackBar(content: Text(e),),);
   setState(() {
     loading=false;
   });
}
setState(() {
  loading=false;
});
    if(userCredential.user.uid.trim().isEmpty){
      return;
    }
    else{
      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NavBar()));
    }
  }
  void validation(){
    if(name.text.trim().isEmpty || name.text.trim()==null){
      globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              "Name is Empty",
            ),
          ),
      );
      return;
    }
    if(mail.text.trim().isEmpty || mail.text.trim()==null){
      globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              "Email is Empty",
            ),
          ),
      );
      return;
    }
    else if(!regExp.hasMatch(mail.text)){
      globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              "Email is Invalid",
            ),
          ),
      );
      return;
    }
    if(password.text.trim().isEmpty || password.text.trim()==null){
      globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              "Password is Empty",
            ),
          ),
      );
      return;
    }
    else{
      setState(() {
        loading=true;
      });
      sendData();

    }

  }
  Widget  textField({@required String hintText,@required IconData icon,obscureText,@required controller}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      showCursor: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        prefixIcon: Icon(icon,
          color: Color(0xFF666666),
        ),
        fillColor: Color(0xFFF2F3F5),
        hintStyle: TextStyle(
          color: Color(0xFF666666),
        ),
        hintText: hintText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'RobotoCondensed-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    return Scaffold(
      key: globalKey,
      body : Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pic2.png"),
            fit: BoxFit.cover,
          ),
        ),
      child : Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   Container(
                      child: Text(
                        "Sign Up ",
                        style: TextStyle(
                          color: Colors.amber,
                          fontFamily: defaultFontFamily,
                          fontSize: 30.0,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                   ),
                  SizedBox(
                    height: 20
                  ),
                  textField(
                    controller: name,
                    hintText: 'Name',
                    icon: Icons.face,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  textField(
                    controller: mail,
                    hintText: 'Email',
                    icon: Icons.mail,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: password,
                      obscureText: _obscureText,
                      showCursor: true,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(Icons.lock,
                      color: Color(0xFF666666),
                    ),
                    suffix: IconButton(
                      icon: Icon(
                          _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      ),
                      color: Colors.blue,
                      onPressed: (){
                        setState(() {
                          _obscureText=!_obscureText;
                        });
                      }
                    ),
                    fillColor: Color(0xFFF2F3F5),
                    hintStyle: TextStyle(
                    color: Color(0xFF666666),
                    ),
                    hintText: 'Password',
                    ),
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  loading?Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(),
                  ],
                  ):
                    Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFFfbab66),
                      ),
                      BoxShadow(
                        color: Color(0xFFf7418c),
                      ),
                  ],
//                  gradient: new LinearGradient(
//                  colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
//                  begin: const FractionalOffset(0.2, 0.2),
//                  end: const FractionalOffset(1.0, 1.0),
//                  stops: [0.0, 1.0],
//                  tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Color(0xFFf7418c),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding:
                        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                        "Register",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "WorkSansBold"),
                      ),
                    ),
                  onPressed: () {
                      validation();
                  }
                  ),
              ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}



