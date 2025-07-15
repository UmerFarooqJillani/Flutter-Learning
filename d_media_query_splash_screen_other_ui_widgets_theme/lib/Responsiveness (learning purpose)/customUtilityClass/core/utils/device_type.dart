/*
==> Returns the screen type based on width:

    =>  < 600     → mobile
    =>  600–899   → tablet
    =>  ≥ 900     → desktop
*/
import 'package:flutter/material.dart';

// enumeration (or enum) is a user-defined data type that
// consists of a set of named integer constants
enum DeviceScreenType { mobile, tablet, desktop }

class DeviceType {
  static DeviceScreenType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 900) return DeviceScreenType.desktop;
    if (width >= 600) return DeviceScreenType.tablet;
    return DeviceScreenType.mobile;
  }

}
