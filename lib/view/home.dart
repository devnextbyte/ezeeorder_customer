import 'package:easyorder/util/snippets.dart';
import 'package:easyorder/view/cart_view.dart';
import 'package:easyorder/view/home/categories_view.dart';
import 'package:easyorder/view/home/products_view.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoriesView(),
            ProductsView(),
          ],
        ));
  }

  AppBar getAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){
          Share.share('check out my website https://example.com',
              subject: 'Look what I made!');
        },
        child: Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(
            Icons.share,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      title: Image.asset('assets/logo.png'),
      actions: [
        GestureDetector(
          onTap: () => push(context, const CartView()),
          child: Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
