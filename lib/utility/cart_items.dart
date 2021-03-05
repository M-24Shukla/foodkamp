
import 'package:flutter/material.dart';
import 'package:food_kamp/tools/countview.dart';

class CartItem extends StatelessWidget {
  String productName;
  String productPrice;
  String productImage;
  String productCartQuantity;

  CartItem({
    Key key,
    @required this.productName,
    @required this.productPrice,
    @required this.productImage,
    @required this.productCartQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 130,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                          child: Image.asset(
                            "assets/IMAGES/$productImage.png",
                            width: 110,
                            height: 100,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "$productName",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF3a3a3b),
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  "₹ $productPrice",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF3a3a3b),
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              "assets/images/menus/ic_delete.png",
                              width: 25,
                              height: 25,
                            ),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerRight,
                          child: CountButtonView(
                            initialCount: int.parse(productCartQuantity),
                            onChange: (count) {
                            },
                          )
                      )],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
