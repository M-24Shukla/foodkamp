import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_kamp/phoneverify.dart';
import 'home.dart';
import  'main.dart';
import 'Sign_Up.dart';
import 'main2.dart';


class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final String hintText;
  final bool obscureText;
  const LoginPage({Key key, this.hintText, this.obscureText}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool loading=false;
  RegExp regExp =RegExp(LoginPage.pattern);
  GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  UserCredential userCredential;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool _obscureText=true;

  @override

  Future loginAuth()async{
    try {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: password.text
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
     globalKey.currentState.showSnackBar(SnackBar(content: Text('No user found for that email.'),),);
  } else if (e.code == 'wrong-password') {
     globalKey.currentState.showSnackBar(SnackBar(content: Text('Wrong password provided for that user.'),),);
     setState(() {
       loading=false;
     });
  }
  setState(() {
    loading=false;
  });
  return;
}
  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NavBar()));
  }
  void validation() {
    if (email.text
        .trim()
        .isEmpty || email.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Email is Empty",
          ),
        ),
      );
      return;
    }
    else if(!regExp.hasMatch(email.text)){
      globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              "Email is Invalid",
            ),
          ),
      );
      return;
    }
    if (password.text
        .trim()
        .isEmpty || password.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Password is Empty",
          ),
        ),
      );
      return;
    }
    setState(() {
      loading=true;
    });
    loginAuth();
  }



  Widget build(BuildContext context) {
    String defaultFontFamily = 'RobotoCondensed-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    return Scaffold(

      key: globalKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pic1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 20
                    ),
                    TextFormField(
                      controller: email,
                     obscureText: false,
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
                    prefixIcon: Icon(Icons.mail,
                      color: Color(0xFF666666),
                    ),
                    fillColor: Color(0xFFF2F3F5),
                    hintStyle: TextStyle(
                    color: Color(0xFF666666),
                    ),
                    hintText: 'Email',
                    ),
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
                    /*textField(
                      hintText: 'Password',
                      icon: Icons.remove_red_eye,
                      obscureText: true,
                    ),*/
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    loading?CircularProgressIndicator(): Container(
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
//                    gradient: new LinearGradient(
//                    colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
//                    begin: const FractionalOffset(0.2, 0.2),
//                    end: const FractionalOffset(1.0, 1.0),
//                    stops: [0.0, 1.0],
//                    tileMode: TileMode.clamp),
                    ),
                    child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Color(0xFFf7418c),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                       color: Colors.white,
                      fontSize: 25.0,
                       fontFamily: "WorkSansBold"),
                        ),
                      ),
                     onPressed: () {
                      validation();
                    }),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            "Don't Have an Account? Sign Up",
                            style: TextStyle(
                            color: Colors.amber,
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



