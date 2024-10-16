import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget smallMobile;
  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;

  const Responsive({
    super.key,
    required this.smallMobile,
    required this.mobile,
    required this.tablet,
    this.desktop,
  });

  /// SMALL MOPILE height < 690
  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.height < 690;

  /// MOPILE < 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  /// TABLET >= 650
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  /// DESKTOP >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop!;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else if (constraints.minHeight < 690) {
          return smallMobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
