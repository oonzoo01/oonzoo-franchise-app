import 'package:flutter/material.dart';

class ResponsiveRatio {
  double height(BuildContext ctx, double height) {
    return MediaQuery.of(ctx).size.height * height;
  }

  double width(BuildContext ctx, double width) {
    return MediaQuery.of(ctx).size.height * width;
  }
}

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  });
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width > 1200;

  static bool isLargeTab(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 800 &&
      MediaQuery.of(ctx).size.width <= 1200;

  static bool isSmallTab(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 500 &&
      MediaQuery.of(ctx).size.width < 800;

  static bool isMobile(BuildContext ctx) => MediaQuery.of(ctx).size.width < 500;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
