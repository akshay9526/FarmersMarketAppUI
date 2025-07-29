import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';

import '../data/products.dart';
import '../widgets/cartitems.dart';
import 'login_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartItems = products.take(5).toList();

  @override
  Widget build(BuildContext context) {
    final total = cartItems
        .map((cartItem) => cartItem.price)
        .reduce((value, element) => value + element)
        .toStringAsFixed(2);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Scrollable cart items
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CartItem(cartItem: cartItem),
                  );
                },
              ),
            ),

            // Fixed total and checkout button
            Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total (${cartItems.length} items)",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$$total",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                buildAuthButton(
                  context: context,
                  assetPath: 'assets/checkout.png',
                  label: AppConstants.proceed_checkout,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
