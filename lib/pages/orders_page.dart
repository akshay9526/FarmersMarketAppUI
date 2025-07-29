import 'dart:math';

import 'package:flutter/material.dart';

import '../data/orders.dart';
import '../widgets/order_item.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ["Processing", "Picking", "Shipping", "Delivered"];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          body: DefaultTabController(
            length: tabs.length,
            child: Column(
              children: [
                TabBar(
                  physics: const BouncingScrollPhysics(),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: List.generate(tabs.length, (index) {
                    return Tab(
                      text: "${tabs[index]} ${Random().nextInt(10)}",
                    );
                  }),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      tabs.length,
                      (index) {
                        return ListView(
                          padding: const EdgeInsets.all(16),
                          children: List.generate(
                            orders.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: OrderItem(order: orders[index]),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
