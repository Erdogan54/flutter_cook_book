import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Deneme1 extends StatelessWidget {
  const Deneme1({super.key});

  @override
  Widget build(BuildContext context) {
    print((7 * 4) % 18);
    return Scaffold(
      backgroundColor: Colors.primaries[(25 * 4) % Colors.primaries.length],
    );
  }
}
