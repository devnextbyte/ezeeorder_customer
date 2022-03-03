import 'package:country_code_picker/country_code_picker.dart';
import 'package:easyorder/util/snippets.dart';
import 'package:easyorder/view/resuseble/LoaderButton.dart';
import 'package:easyorder/view/verification_code.dart';
import 'package:flutter/material.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getBottom(context),
    );
  }

  AppBar getAppBar(context) {
    return AppBar(
      title: const Text('User Info', style: TextStyle(color: Colors.black)),
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

  Widget getBottom(context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 767),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Name",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.grey,fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Your Name Here'),
            ),
            const SizedBox(height: 8),
            Text("Phone Number",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.grey,fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: '123 456 7890',
                prefixIcon: CountryCodePicker(
                  onChanged: print,
                  initialSelection: 'PK',
                  favorite: const ['+92', 'PK'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                ),
              ),
            ),
            const SizedBox(height: 24),
            LoaderButton(
                child: const Text('Send OTP'),
                onPressed: () async => push(context, const VerificationCode()))
          ],
        ),
      ),
    );
  }
}
