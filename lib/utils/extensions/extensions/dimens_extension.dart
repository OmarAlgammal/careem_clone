
import 'package:flutter/cupertino.dart';

extension DimensExtension on BuildContext{

  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.height;
}