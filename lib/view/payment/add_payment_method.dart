import 'package:easyorder/view/resuseble/LoaderButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_cvc_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_expiration_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart';

class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  int card = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight - 24, maxWidth: 767),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select Payment Method",
                          style: Theme.of(context).textTheme.subtitle2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              value: 0,
                              title: Image.asset('assets/masterCard.png',
                                  height: 50, width: 50),
                              dense: true,
                              groupValue: card,
                              onChanged: (int? val) {
                                card = val!;
                                setState(() {});
                              },
                            ),
                          ),
                          Flexible(
                            child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              value: 1,
                              title: Image.asset(
                                'assets/visaCard.png',
                                height: 50,
                                width: 50,
                              ),
                              dense: true,
                              groupValue: card,
                              onChanged: (int? val) {
                                card = val!;
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      getPaymentForm(context)
                    ],
                  ),
                  LoaderButton(
                    child: const Text('Done'),
                    onPressed: () async => Navigator.pop(context),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  AppBar getAppBar(context) {
    return AppBar(
      title: const Text('Checkout', style: TextStyle(color: Colors.black)),
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
          child: const Icon(Icons.clear, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget getPaymentForm(context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Card Holder Name",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.grey,fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your Name",
              fillColor: Colors.white,
              filled: true,
              suffixIcon:
                  const Icon(Icons.check_circle, size: 20, color: Colors.green),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text("Card Number",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.grey,fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter your Card"),
            inputFormatters: [
              CreditCardNumberInputFormatter(useSeparators: false)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Expiry Date",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.grey,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "08/25",
                        suffixIcon: Icon(Icons.check_circle,
                            size: 20, color: Colors.green),
                      ),
                      inputFormatters: [CreditCardExpirationDateFormatter()],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CVV",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.grey,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.check_circle,
                            size: 20, color: Colors.green),
                      ),
                      inputFormatters: [CreditCardCvcInputFormatter()],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
