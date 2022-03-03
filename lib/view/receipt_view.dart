import 'package:easyorder/util/snippets.dart';
import 'package:easyorder/view/resuseble/LoaderButton.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ReceiptView extends StatelessWidget {
  const ReceiptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Column(
        children: [
          Center(child: getReceipt(context)),
          const Spacer(),
          getBottom(context)
        ],
      ),
    );
  }

  AppBar getAppBar(context) {
    return AppBar(
      title: const Text('Receipt', style: TextStyle(color: Colors.black)),
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

  Widget getReceipt(context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 767),
      margin: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                  child: Image.asset('assets/receipt.png')),
              getRowText(context, title: 'Name', text: 'Saad Malik'),
              getRowText(context,
                  title: 'Phone Number', text: '+9232445555341'),
              getRowText(context,
                  title: 'Date and Time', text: '10/01/2021  12:00AM'),
              getRowText(context, title: 'Payment Status', text: 'Paid'),
              getDivider(),
              getRowText(context, title: 'Tax', text: '\$50'),
              getRowText(context, title: 'Service Charges', text: '\$50'),
              getDivider(),
              getTotal(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getRowText(context, {title, text}) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ],
    );
  }

  Widget getTotal(context, {title, text}) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.grey)),
            Text('\$33.00',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ],
    );
  }

  Widget getDivider() {
    return const Padding(
        padding: EdgeInsets.only(top: 16), child: Divider(height: 0));
  }

  Widget getBottom(context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 767),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Share.share('check out my website https://example.com',
                    subject: 'Look what I made!');
              },
              icon: const Icon(Icons.share),
              label: const Text('Share'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: getRoundBorder()),
                  minimumSize: const Size(double.infinity, 50)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Download'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: getRoundBorder()),
                  minimumSize: const Size(double.infinity, 50)),
            ),
          ),
        ],
      ),
    );
  }
}
