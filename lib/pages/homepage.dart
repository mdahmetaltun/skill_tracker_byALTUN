import 'package:flutter/material.dart';
import 'package:skill_tracker/widgets/all_skill_list.dart';
import 'package:skill_tracker/widgets/all_course_list.dart';
import 'package:skill_tracker/widgets/custom_appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // @override

  // void initState() {
  // super.initState();
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('FCM message recieved');
  // });
  // }

  @override
  Widget build(BuildContext context) {
    // final _productsProvider = Provider.of<Products>(context);
    // _productsProvider.fetchProducts();

    // final _ordersProvider = Provider.of<Orders>(context);
    // _ordersProvider.fetchOrders();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Courses(),
              SizedBox(height: 10,),
              AllSkills(),
            ],
          ),
        ),
      ),
    );
  }
}
