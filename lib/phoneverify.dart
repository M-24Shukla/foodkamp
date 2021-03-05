import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'otp.dart';

class PhoneVerify extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const PhoneVerify({Key key, this.hintText, this.obscureText, this.controller}) : super(key: key);
  _PhoneVerifyState createState() => _PhoneVerifyState();
}

class _PhoneVerifyState extends State<PhoneVerify> {
  RegExp regExp =RegExp(r'^[0-9]{10}');
  TextEditingController phone=TextEditingController();
  GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  void validation(){
    if(phone.text.trim().isEmpty || phone.text.trim()==null){
      globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              "Phone no is Empty",
            ),
          ),
      );
      return;
    }
    else if(!regExp.hasMatch(phone.text)){
      globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              "Phone no is Invalid",
            ),
          ),
      );
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OTP(phone.text)));

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
                        "Verify Phone No",
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
                    controller: phone,
                    hintText: 'Phone',
                    icon: Icons.phone,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
                        "Get OTP",
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