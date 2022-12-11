import 'package:flutter/material.dart';
import '1-animation/1-animate_a_page_route_transition.dart';
import '1-animation/2-animate_spring_physics_simulation.dart';
import '1-animation/3-animated_container.dart';
import '1-animation/4-fade_a_widget_in_and_out.dart';
import '2-design/1-drawer.dart';
import '2-design/2-snackbar.dart';
import '2-design/3-update_ui_orientation.dart';
import '2-design/4-google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      home: const GoogleFontsExample(),
    ),
  );
}
