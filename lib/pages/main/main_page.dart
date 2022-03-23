import 'package:calculate_window/layouts/default_layout.dart';
import 'package:calculate_window/models/order.dart';
import 'package:calculate_window/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderProvider>().initData();
  }

  @override
  Widget build(BuildContext context) {
    List<Order> orders = context.watch<OrderProvider>().orders;

    return DefaultLayout(
      appBar: AppBar(
        title: const Text("Список заказов"),
        actions: [
          IconButton(
            onPressed: () async {
              context.read<OrderProvider>().add(
                    Order(
                      id: orders.length + 1,
                      address: "address " + (orders.length + 1).toString(),
                    ),
                  );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text(orders[index].address),
                );
              },
              childCount: orders.length,
            ),
          ),
        ],
      ),
    );
  }
}
