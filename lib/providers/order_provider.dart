import 'package:calculate_window/models/order.dart';
import 'package:calculate_window/providers/base_provider.dart';
import 'package:calculate_window/providers/db_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqlite_api.dart';

class OrderProvider extends ChangeNotifier implements BaseProvider {
  @override
  String get table => "orders";

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  initData() async {
    Database db = await DBProvider.database;
    List<Map<String, Object?>> list =
        await db.rawQuery("SELECT * FROM " + table);
    _orders = list.map((e) => Order.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> add(Order order) async {
    _orders.add(order);
    Database db = await DBProvider.database;
    db.insert(
      table,
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }
}
