import 'package:easyorder/util/snippets.dart';
import 'package:easyorder/view/payment/payment_view.dart';
import 'package:easyorder/view/resuseble/LoaderButton.dart';
import 'package:easyorder/view/resuseble/cart_item_card.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 767),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => const CartItemCard(),
                      ),
                    ),
                    const Divider(thickness: 2, height: 32),
                    amountCard(),
                    Card(
                      margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.transparent)),
                      child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              getBottom()
            ],
          ),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Text('Cart', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget amountCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('SubTotal',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16)),
              Text('\$25',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Tax',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.grey)),
              Text('\$25',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w500,

                      color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Service Charges',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.grey)),
              Text('\$25',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w500,

                      color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget getBottom(){
    return  Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Total',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(
                      fontWeight: FontWeight.w500, fontSize: 16)),
              Text('\$33.00',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 16),
          LoaderButton(
              child: const Text('Payment Order'),
              onPressed: () async =>
                  push(context, const PaymentView())),
        ],
      ),
    );
  }

}
