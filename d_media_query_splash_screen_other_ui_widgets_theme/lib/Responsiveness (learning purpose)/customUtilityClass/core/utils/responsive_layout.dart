/*
Use ResponsiveLayout to easily plug in 3 UIs without writing MediaQuery everywhere.
*/
import 'package:flutter/material.dart';
import 'device_type.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final type = DeviceType.getDeviceType(context);

    if (type == DeviceScreenType.tablet) return tablet;
    if (type == DeviceScreenType.desktop) return desktop;
    return mobile;
  }
}
