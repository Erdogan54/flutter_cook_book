import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScaffoldMessengerState? _scaffoldState = scaffoldKey.currentState;

    final snackBar = SnackBar(
      content: const Text("Yay! A SnackBar "),
      action: SnackBarAction(
        label: "Done",
        onPressed: () {
          // ScaffoldMessenger.of(context).removeCurrentSnackBar();
          _scaffoldState?.removeCurrentSnackBar();
        },
      ),
    );

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("ShowSnacBar"),
          onPressed: () {
            _scaffoldState?.showSnackBar(snackBar);
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
