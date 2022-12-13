import 'package:flutter/material.dart';

import '2-filter_selector.dart';

@immutable
class ExampleInstagramFilterSelection extends StatefulWidget {
  const ExampleInstagramFilterSelection({super.key});

  @override
  State<ExampleInstagramFilterSelection> createState() => _ExampleInstagramFilterSelectionState();
}

class _ExampleInstagramFilterSelectionState extends State<ExampleInstagramFilterSelection> {
 

  final _filterColor = ValueNotifier<Color>(Colors.white);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: _filteredImage(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _filterSelector(),
          ),
        ],
      ),
    );
  }

  ValueListenableBuilder<Color> _filteredImage() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, value, child) {
        final color = value;
        return Image.network(
          'https://docs.flutter.dev/cookbook/img-files/effects/instagram-buttons/millenial-dude.jpg',
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
        );
      },
    );
  }

  FilterSelector _filterSelector() {
    return FilterSelector(
      onFilterChanged: (selectedColor) {
        _filterColor.value = selectedColor;
      },
     
    );
  }
}
