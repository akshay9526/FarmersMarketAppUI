import 'package:flutter/material.dart';

import '../data/products.dart';
import '../widgets/myproductitems.dart';
import 'addnewproduct.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  final cartItems = products.take(5).toList();

  @override
  Widget build(BuildContext context) {
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
                    child: MyProductsItem(cartItem: cartItem),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddNewProduct()));
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: const Color(0xFFF5F5DC),
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
