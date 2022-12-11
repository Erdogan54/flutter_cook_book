import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
}
