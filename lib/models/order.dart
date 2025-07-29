

import 'package:farmersmarket/models/products.dart';

class Order {
  final String id;
  final List<Products> products;
  final DateTime date;
  Order({
    required this.id,
    required this.products,
    required this.date,
  });
}
