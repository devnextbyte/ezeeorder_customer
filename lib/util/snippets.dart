import 'dart:convert';

import 'package:flutter/material.dart';

String? Function(String?) get mandatoryValidator =>
    (String? val) => val?.isEmpty ?? true ? "This field is mandatory" : null;


RoundedRectangleBorder getRoundShape() =>
    RoundedRectangleBorder(borderRadius: getRoundBorder());

BorderRadius getRoundBorder() => BorderRadius.circular(20);

String? Function(String?) get emailValidator => (String? email) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email ?? "")
        ? null
        : "Enter a valid email";

Future<dynamic> showDialogOf(context, Widget child,
    {isDismissible = true}) async {
  showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return child;
      });
}

void pushNamed(BuildContext context, String routeName) =>
    Navigator.pushNamed(context, routeName);

String? Function(String?) get passwordValidator => (String? password) =>
    (password?.length ?? 0) < 8 ? "Password too short" : null;

Future<T?> push<T>(BuildContext context, Widget child) =>
    Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => child));

void replace(BuildContext context, Widget child) => Navigator.of(context)
    .pushReplacement(MaterialPageRoute(builder: (_) => child));

void pop(BuildContext context) => Navigator.of(context).pop();

void popToMain(BuildContext context) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

void snack(BuildContext context, String message, {bool info = false}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: info ? Colors.green : Colors.red,
      // behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Colors.white,
            ),
      ),
    ));

Widget getLoader() => const Center(child: CircularProgressIndicator());

bool isKeyboardOpen(BuildContext context) =>
    MediaQuery.of(context).viewInsets.bottom != 0;
