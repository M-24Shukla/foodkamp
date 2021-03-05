import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef void CountButtonClickCallBack(int count);
class CountButtonView extends StatefulWidget {
  final int initialCount;
  final CountButtonClickCallBack onChange;
  CountButtonView({this.initialCount, this.onChange});
  @override
  _CountButtonViewState createState() => _CountButtonViewState();
}
class _CountButtonViewState extends State<CountButtonView> {
  int count;
  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }
  @override
  void dispose() {
    super.dispose();
  }
  void updateCount(int addValue) {
    if (count + addValue >= 0) {
      setState(() {
        count += addValue;
      });
      if (widget.onChange != null) {
        widget.onChange(count);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 74,
        decoration: BoxDecoration(
            color: Color(0xddFFFFFF),
            border: Border.all(color: Colors.brown, width: 1.7),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    updateCount(-1);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                      width: 20.0,
                      child: Center(
                          child: Icon(Icons.remove,color: Colors.brown, )
                      ))),
              Container(
                child: Center(
                    child: Text(
                      '$count',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.brown,
                          decoration: TextDecoration.none),
                    )),
              ),
              GestureDetector(
                  onTap: () {
                    updateCount(1);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                      width: 22.0,
                      child: Center(
                          child: Icon(Icons.add,color: Colors.brown,)
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
