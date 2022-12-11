import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrientationBuilderExample extends StatelessWidget {
  const OrientationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).orientation;
    return Scaffold(body: OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 6,
            children: List.generate(
                50,
                (index) => Text(
                      "item $index",
                      style: Theme.of(context).textTheme.headline5,
                    )));
      },
    ));
  }
}
