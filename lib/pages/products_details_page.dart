
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../constants/imageurls.dart';
import '../data/products.dart';
import '../models/products.dart';
import 'login_page.dart';

class ProductsDetailsPage extends StatefulWidget {
  const ProductsDetailsPage({super.key, required this.products});

  final Products products;

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  int quantity = 0;
  bool showMore = false;
  late TapGestureRecognizer readMoreGestureRecog;

  @override
  void initState() {
    readMoreGestureRecog = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMore = !showMore;
        });
      };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecog.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.products.name)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconlyBroken.bookmark))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                height: 250,
                autoPlayInterval: const Duration(seconds: 3),
                reverse: false,
                aspectRatio: 5.0),
            itemCount: imgList.length,
            itemBuilder: (context, i, id) {
              return GestureDetector(
                child: Container(
                  height: 250,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imgList[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          Text(
            widget.products.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppConstants.avail_in_stk,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "\$${widget.products.price.toString()}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextSpan(
                  text: "\$${widget.products.unit.toString()}",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ])),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade600,
              ),
              const SizedBox(
                width: 10,
              ),
              Text('${widget.products.rating}'),
              const Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 0,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "${quantity.toString() + " " + widget.products.unit}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 0,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) {
                        quantity--;
                      }
                    });
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.remove,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppConstants.desc,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                TextSpan(
                    text: showMore
                        ? widget.products.description
                        : '${widget.products.description.substring(0, widget.products.description.length - 100)}...'),
                TextSpan(
                    recognizer: readMoreGestureRecog,
                    text: showMore ? " Read Less" : " Read More",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary))
              ])),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppConstants.relatedprdt,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(products[index].image))),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: products.length),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            height: MediaQuery.of(context).size.width * 0.13,
            child: buildAuthButton(
              context: context,
              assetPath: 'assets/trolley.png',
              label: AppConstants.add_to_cart,
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
