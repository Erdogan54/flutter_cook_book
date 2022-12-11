import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsExample extends StatelessWidget {
  const GoogleFontsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body: GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 6,
            children: List.generate(
                50,
                (index) => Text(
                      "item $index",
                      //style: Theme.of(context).textTheme.headline5?.copyWith(fontFamily: "Lobster"),
                      //style: Theme.of(context).textTheme.headline6?.copyWith(fontFamily: "zendots"),
                      style: GoogleFonts.lobster(),
                    ))));
  }
}
