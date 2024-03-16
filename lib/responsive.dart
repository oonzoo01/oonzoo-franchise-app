import 'package:flutter/material.dart';

class ResponsiveRatio {
  double height(BuildContext ctx, double height) {
    return MediaQuery.of(ctx).size.height * height;
  }

  double width(BuildContext ctx, double width) {
    return MediaQuery.of(ctx).size.height * width;
  }
}
