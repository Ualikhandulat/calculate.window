import 'package:calculate_window/providers/db_provider.dart';
import 'package:calculate_window/providers/order_provider.dart';
import 'package:provider/provider.dart';

final List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
];
