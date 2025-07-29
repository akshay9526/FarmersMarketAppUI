
import 'package:badges/badges.dart' as badges;
import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:farmersmarket/pages/CustomScaffold.dart';
import 'package:farmersmarket/pages/cart_page.dart';
import 'package:farmersmarket/pages/explore_page.dart';
import 'package:farmersmarket/pages/my_products.dart';
import 'package:farmersmarket/pages/orders_page.dart';
import 'package:farmersmarket/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ScreenHiddenDrawer> pages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "🏠 Home",
          baseStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          selectedStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          colorLineSelected: Theme.of(context).primaryColor,
        ),
        const CustomScaffold(
          child: ExplorePage(),
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "⚙️ Services",
          baseStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          selectedStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          colorLineSelected: Theme.of(context).primaryColor,
        ),
        const CustomScaffold(
          child: ServicePage(),
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "🌾 My Products",
          baseStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          selectedStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          colorLineSelected: Theme.of(context).primaryColor,
        ),
        const CustomScaffold(
          child: MyProducts(),
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "🧺 Cart",
          baseStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          selectedStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          colorLineSelected: Theme.of(context).primaryColor,
        ),
        const CustomScaffold(
          child: CartPage(),
        ),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "🚚 My Orders",
          baseStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          selectedStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          colorLineSelected: Theme.of(context).primaryColor,
        ),
        const CustomScaffold(
          child: OrdersPage(),
        ),
      ),
    ];

    return HiddenDrawerMenu(
      screens: pages,
      backgroundColorMenu: Theme.of(context).scaffoldBackgroundColor,
      slidePercent: 60,
      contentCornerRadius: 20,
      backgroundColorAppBar: Theme.of(context).colorScheme.primary,
      styleAutoTittleName: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      withAutoTittleName: true,
      tittleAppBar: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset('assets/user.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi, User 🖐",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                Text(
                  AppConstants.enjoy_service,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.8),
                      ),
                ),
              ],
            ),
          )
        ],
      ),
      actionsAppBar: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton.filledTonal(
            onPressed: () {
              // handle tap
            },
            icon: badges.Badge(
              badgeContent: const Text(
                '10',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
              position: badges.BadgePosition.topEnd(top: -15, end: -12),
              child: const Icon(IconlyBroken.notification),
            ),
          ),
        ),
      ],
    );
  }
}
