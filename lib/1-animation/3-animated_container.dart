import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  double _radius = 10;
  Color _color = Colors.lightGreen;
  Alignment _alignment = Alignment.center;
  bool _isPlay = false;
  final random = Random();
  late Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    print("size.height: ${size.height}");
    print("size.width: ${size.width}");
    print("size.aspectRatio: ${size.aspectRatio}");
    print("size.flipped: ${size.flipped}");
    print("size.longestSide: ${size.longestSide}");
    print("size.shortestSide: ${size.shortestSide}");
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _randomAll();
          });
        },
        onDoubleTap: () {
          print("onDoubleTap");
          setState(() {
            _alignment += const Alignment(-0.1, -0.1);
          });
        },
        // onPanUpdate: (details) {
        //   setState(() {
        //     _alignment += Alignment(
        //       details.delta.dx / (size.width / 2.5),
        //       details.delta.dy / (size.height / 2.5),
        //     );
        //   });
        // },
        onHorizontalDragStart: (details) {
          print("onHorizontalDragStart");
          print("${details.kind}");
          print("details.localPosition.dx: ${details.localPosition.dx}");
          print("details.localPosition.dy: ${details.localPosition.dy}");

          // setState(() {
          //   _alignment += Alignment(
          //     details.localPosition.dx / size.width,
          //     details.localPosition.dy / size.height,
          //   );
          // });
        },
        onHorizontalDragEnd: (details) {
          print("onHorizontalDragEnd");
          print("details.velocity: ${details.velocity}");
          print("details.primaryVelocity: ${details.primaryVelocity}");
        },
        onHorizontalDragCancel: () {
          print("onHorizontalDragCancel");
        },
        onHorizontalDragDown: (details) {
          print("onHorizontalDragDown");
        },
        onHorizontalDragUpdate: (details) {
          setState(() {
            _alignment += Alignment(
              details.delta.dx / (size.width / 2.5),
              details.delta.dy,
            );
          });
        },
        onVerticalDragUpdate: (details) {
          setState(() {
            _alignment += Alignment(
              details.delta.dx,
              details.delta.dy / (size.height / 2.5),
            );
          });
        },
        onLongPressMoveUpdate: (details) {
          print("onLongPressMoveUpdate");

          print("details.globalPosition: ${details.globalPosition}");
          print("details.localPosition: ${details.localPosition}");
          print("details.localOffsetFromOrigin: ${details.localOffsetFromOrigin}");
          print("details.offsetFromOrigin: ${details.offsetFromOrigin}");
        },
        

        child: Builder(builder: (context) {
          print("x:${_alignment.x.toStringAsFixed(2)} / y:${_alignment.y.toStringAsFixed(2)}");
          return Align(
            alignment: _alignment,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              height: _height,
              width: _width,
              decoration: BoxDecoration(color: _color, borderRadius: BorderRadius.circular(_radius)),
            ),
          );
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.stop),
              onPressed: () {
                setState(() {
                  _isPlay = false;
                });
              },
            ),
            FloatingActionButton(
              child: Icon(_isPlay ? Icons.keyboard_double_arrow_right_outlined : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  _isPlay = true;
                  _playWidget();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _playWidget() async {
    print(_isPlay);
    while (_isPlay) {
      print("run");
      await Future.delayed(const Duration(milliseconds: 1500));
      setState(() {
        _randomAll();
      });
    }
  }

  void _randomAll() {
    _randomLocation();
    _randomSize();
    _randomColor();
  }

  void _randomLocation() => _alignment = Alignment(random.nextDouble(), random.nextDouble());

  void _randomSize() {
    _width = random.nextDouble() * 300;
    _height = random.nextDouble() * 300;
    _radius = random.nextDouble() * 100;
  }

  void _randomColor() {
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
