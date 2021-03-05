import 'package:flutter/cupertino.dart';
import 'package:food_kamp/utility/total_item_list.dart';

class OrderList extends ChangeNotifier {
  int total_items = 0, cost = 0;
  List<TotalItemList> total_item_bill = [];
  Map<String, PriceAndQt> orders = new Map();
  String get getTotal {
    return total_items.toString();
  }
  String get totalBill {
    return cost.toString();
  }
  void modifyTotal(int c) {
    total_items = c;
    notifyListeners();
  }

  void updateTotalList() {
    orders.forEach((key, value) {
      if (value.qty > 0) {
        cost += value.qty*int.parse(value.price);
        total_item_bill.add(
          TotalItemList(
            name: key,
            price: (value.qty * int.parse(value.price)).toString(),
          )
        );
      }
    });
    total_item_bill.add(TotalItemList(name: "Total", price: cost.toString(),));
    notifyListeners();
  }

}

class PriceAndQt {
  String price = "15";
  int qty = 0;
  PriceAndQt({this.price, this.qty});
}
