import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 25),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                    text: 'Hey Ahmet, what are you\n looking for ', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                TextSpan(text: '🤪', style: TextStyle(fontSize: 25)),
              ]),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 0.1, blurRadius: 0.1, offset: const Offset(0, 1))]),
                  padding: const EdgeInsets.all(10),
                  child: const InkWell(
                      // onTap: () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => CartScreen()));
                      // },
                      child: Icon(Icons.shopping_cart_outlined, color: Colors.grey)),
                ),
                Positioned(right: 10, top: 10, child: Container(height: 10))
              ],
            )
          ])),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
