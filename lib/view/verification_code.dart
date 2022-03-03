import 'package:easyorder/util/snippets.dart';
import 'package:easyorder/view/receipt_view.dart';
import 'package:easyorder/view/resuseble/LoaderButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getBottom(),
    );
  }

  AppBar getAppBar(context) {
    return AppBar(
      title: const Text('Verification Code',
          style: TextStyle(color: Colors.black)),
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

  Widget getBottom() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 767),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Enter Verification Code",
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text("Enter 4 Digit OTP Code",
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.normal)),
            getPinField(),
            const SizedBox(height: 16),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Didn’t Receive OTP?',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black87, fontWeight: FontWeight.normal)),
              TextSpan(
                  text: ' Resend',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500)),
            ])),
            const SizedBox(height: 32),
            LoaderButton(
                child: const Text('Verify Now'), onPressed: () async => push(context, const ReceiptView()))
          ],
        ),
      ),
    );
  }

  Widget getPinField() {
    return SizedBox(
      width: 260,
      child: PinCodeTextField(
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        pinTheme: PinTheme(
          activeColor: Colors.grey,
          selectedColor: Theme.of(context).primaryColor,
          disabledColor: Colors.grey,
          inactiveColor: Colors.grey,
        ),
        animationDuration: const Duration(milliseconds: 200),
        enableActiveFill: false,
        onCompleted: (v) async {},
        onChanged: (value) {},
        beforeTextPaste: (text) {
          return true;
        },
        appContext: context,
      ),
    );
  }
}
