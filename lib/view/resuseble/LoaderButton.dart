import 'package:easyorder/util/snippets.dart';
import 'package:flutter/material.dart';

class LoaderButton extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onPressed;

  const LoaderButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  _LoaderButtonState createState() => _LoaderButtonState();
}

class _LoaderButtonState extends State<LoaderButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? getLoader()
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: getRoundBorder()),
                minimumSize: Size(MediaQuery.of(context).size.width, 50)),
            onPressed: () async {
              setState(() => loading = true);
              await widget.onPressed();
              setState(() => loading = false);
            },
            child: widget.child,
          );
  }
}
