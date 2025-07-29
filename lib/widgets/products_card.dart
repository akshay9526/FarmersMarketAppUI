
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';
import '../pages/products_details_page.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key, required this.products});

  final Products products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductsDetailsPage(products: products)));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.1,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(width: 0.2, color: Colors.grey.shade400)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(products.image), fit: BoxFit.cover),
              ),
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 25,
                      height: 20,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        minWidth: 0,
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () {},
                        shape: const CircleBorder(),
                        child: Icon(
                          Icons.bookmark,
                          size: 18,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      products.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       AppConstants.price,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        AppConstants.unit,
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${products.price.toString()}",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        "\$${products.unit.toString()}",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
