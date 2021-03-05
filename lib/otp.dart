import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'Sign_Up.dart';
import 'home.dart';

class OTP extends StatefulWidget {
  final String phone;
  OTP(this.phone);
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  get emailUser => null;

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'RobotoCondensed-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    return Scaffold(
      key: _scaffoldkey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pic2.png"),
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
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: PinPut(
                        fieldsCount: 6,
                        textStyle: const TextStyle(
                            fontSize: 25.0, color: Colors.white),
                        eachFieldWidth: 40.0,
                        eachFieldHeight: 55.0,
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: pinPutDecoration,
                        selectedFieldDecoration: pinPutDecoration,
                        followingFieldDecoration: pinPutDecoration,
                        pinAnimationType: PinAnimationType.fade,
                         onSubmit: (pin) async {
                        try {
                        await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                          .then((value) async {
                           if (value.user != null) {
                           Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                          (route) => false);
                         }
                        });
                      } catch (e) {
                         FocusScope.of(context).unfocus();
                        _scaffoldkey.currentState
                        .showSnackBar(SnackBar(content: Text('invalid OTP')));
                      }
                      },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
