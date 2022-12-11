import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../extension/context_extension.dart';

class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("My App"),
      ),
      drawer: Drawer(
        // backgroundColor: Colors.grey,
        semanticLabel: "Drawer menü",
        elevation: 10,
        width: size.width * 0.7,
        shape: Border.all(color: Colors.green, width: 3, style: BorderStyle.solid),
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Drawer Header"),
          ),
          ListTile(
            title: const Text("item 1"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text("item 2"),
            onTap: () => Navigator.pop(context),
          ),
        ]),
      ),
    );
  }
}
