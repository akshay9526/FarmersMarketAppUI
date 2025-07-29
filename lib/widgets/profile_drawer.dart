import 'package:farmersmarket/constants/APpConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileDrawer extends StatelessWidget {
  ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  foregroundImage: AssetImage('assets/userprofile.png'),
                ),
                const SizedBox(height: 4),
                Text(
                  AppConstants.user,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  AppConstants.user_test,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              IconlyLight.home,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              AppConstants.home,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const OrdersPage()),
              // );
            },
          ),
          Divider(
            endIndent: 50,
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
          ListTile(
            leading: Icon(
              IconlyLight.bag,
              color: Theme.of(context).unselectedWidgetColor,
            ),
            title: Text(
              AppConstants.My_orders,
              style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const OrdersPage()),
              // );
            },
          ),
          Divider(
            endIndent: 50,
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
          ListTile(
            leading: Icon(
              IconlyLight.heart,
              color: Theme.of(context).unselectedWidgetColor,
            ),
            title: Text(
              AppConstants.favorites,
              style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const OrdersPage()),
              // );
            },
          ),
          Divider(
            endIndent: 50,
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
          ListTile(
            leading: Icon(
              IconlyLight.bag,
              color: Theme.of(context).unselectedWidgetColor,
            ),
            title: Text(
              AppConstants.cart,
              style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const OrdersPage()),
              // );
            },
          ),
          Divider(
            endIndent: 50,
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
          ListTile(
            leading: Icon(
              IconlyLight.infoSquare,
              color: Theme.of(context).unselectedWidgetColor,
            ),
            title: Text(
              AppConstants.aboutus,
              style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          Divider(
            endIndent: 50,
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
          ListTile(
            leading: Icon(
              IconlyLight.logout,
              color: Theme.of(context).unselectedWidgetColor,
            ),
            title: Text(
             AppConstants.logout,
              style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          Divider(
            endIndent: 50,
            thickness: 1,
            color: Theme.of(context).focusColor,
          ),
        ],
      ),
    );
  }
}
