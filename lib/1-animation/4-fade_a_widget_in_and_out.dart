import 'package:flutter/material.dart';

// The StatefulWidget's job is to take data and create a State class.
// In this case, the widget takes a title, and creates a _MyHomePageState.
class FadeAnimatedOpacity extends StatefulWidget {
  const FadeAnimatedOpacity({
    super.key,
  });

  @override
  State<FadeAnimatedOpacity> createState() => _FadeAnimatedOpacityState();
}

// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _FadeAnimatedOpacityState extends State<FadeAnimatedOpacity> {
  // Whether the green box should be visible
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity"),
      ),
      body: Center(
        child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          onEnd: () {
            print("onEnd Opacity");
          },
          
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
