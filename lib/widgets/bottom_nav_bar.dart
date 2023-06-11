import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_tracker/constants/pages.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final _productsProvider = Provider.of<Products>(context);
    // _productsProvider.fetchProducts();
    // final _orderProvider = Provider.of<Orders>(context);
    // _orderProvider.fetchWaitingVerification();

    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) => setState(() => pageIndex = index),
        currentIndex: pageIndex,
        activeColor: Colors.red,
        inactiveColor: Colors.white,
        backgroundColor: backgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed, size: 20), label: 'Eklenenler'),
          // BottomNavigationBarItem(icon: Icon(Icons.badge_outlined, size: 20), label: 'Rozet Tak'),
          // BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, size: 20), label: 'Kart'),
          // BottomNavigationBarItem(icon: Icon(Icons.upload, size: 20), label: 'Detay Ekranı'),
          // BottomNavigationBarItem(icon: Icon(Icons.person, size: 20), label: 'Profil'),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
