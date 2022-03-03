import 'package:easyorder/util/snippets.dart';
import 'package:easyorder/view/payment/add_payment_method.dart';
import 'package:easyorder/view/resuseble/LoaderButton.dart';
import 'package:easyorder/view/user_info_view.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 767),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getPaymentCard(),
              getBottom(),
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

  Widget getPaymentCard() {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              // height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    visualDensity:
                        const VisualDensity(vertical: -4, horizontal: -4),
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.credit_card,
                        color: Theme.of(context).primaryColor),
                    title: Text(
                      'Payment Method',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    visualDensity:
                        const VisualDensity(vertical: -4, horizontal: -4),
                    contentPadding: EdgeInsets.zero,
                    leading:
                        Icon(Icons.add, color: Theme.of(context).primaryColor),
                    title: Text(
                      'Add a Payment Method',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    ),
                    onTap: () =>
                        showDialogOf(context, const AddPaymentMethod()),
                  )
                ],
              ),
            ),
          ),
          _cardRow()
        ],
      );
    });
  }

  Widget _cardRow() {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      constraints: const BoxConstraints(maxWidth: 425),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/Card_Mask.png',
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                Text(
                  'XXXX XXXX XXXX 4444',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  '12 / 22',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 16),
                Text(
                  "Saad Malik",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        children: [
          amountCard(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Total',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16)),
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
              onPressed: () async => push(context, const UserInfoView())),
        ],
      ),
    );
  }

  Widget amountCard() {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('SubTotal',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                Text('\$25',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
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
                        fontWeight: FontWeight.w500)),
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
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
