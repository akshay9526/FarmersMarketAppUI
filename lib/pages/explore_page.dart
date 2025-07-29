
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../data/products.dart';
import '../widgets/products_card.dart';
import 'login_page.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //Search & Filter
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: AppConstants.search_here,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(99))),
                      prefixIcon: const Icon(IconlyLight.search)),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton.filled(
                      onPressed: () {}, icon: const Icon(IconlyLight.filter)),
                ),
              ],
            ),
          ),

          //Card
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height: 170,
              child: Card(
                color: Colors.green.shade50,
                elevation: 0.1,
                shadowColor: Colors.green.shade50,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.free_consultation,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.green.shade700),
                            ),
                            Text(
                              AppConstants.sprt_cst_srv,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: MediaQuery.of(context).size.width * 0.13,
                              child: buildAuthButton(
                                context: context,
                                assetPath: 'assets/phone_icon.png',
                                label: AppConstants.call_now,
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/contact_us.png',
                        width: 140,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppConstants.featured_products,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(onPressed: () {}, child: Text(AppConstants.see_all))
            ],
          ),

          //Feature Products
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.72),
              itemBuilder: (context, index) {
                return ProductsCard(products: products[index]);
              })
        ],
      ),
    );
  }
}
