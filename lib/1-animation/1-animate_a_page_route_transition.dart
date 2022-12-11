import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Page1()));
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Wrap(
          spacing: 5,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createRouteNormal());
              },
              child: const Text('Go! Normal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute1());
              },
              child: const Text('Go! 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createRoute2());
              },
              child: const Text('Go! 2'),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRouteNormal() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
  );
}

Route _createRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.linear;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.linearToEaseOut;
      final tween = Tween(begin: begin, end: end);
      final curveAnimation = CurvedAnimation(
        curve: curve,
        parent: animation,
      );

      return SlideTransition(
        position: tween.animate(curveAnimation),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
