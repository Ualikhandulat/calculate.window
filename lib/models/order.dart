import 'package:calculate_window/models/base_model.dart';

class Order implements BaseModel {
  final int id;
  final String address;

  const Order({
    required this.id,
    required this.address,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
    };
  }

  Order.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        address = res["address"];
}
