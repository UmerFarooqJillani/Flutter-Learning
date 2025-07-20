/*
--> Package: responsive_builder
    Helps you create different layouts or widgets depending on:
      - Screen type (mobile, tablet, desktop)
      - Screen orientation (portrait, landscape)
      - Screen dimensionsComponents Overview

--> Components
    - ScreenTypeLayout
        Builds different layouts based on device type

    - ResponsiveBuilder
        Gives access to detailed screen size/orientation info

    - OrientationLayoutBuilder
        Switches layout based on portrait/landscape

    - DeviceScreenType
        Enum: mobile, tablet, desktop, watch

    - SizingInformation
        Class with screen size, type, orientation, and constraints

*/
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: HomeScreen())));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //----------------(ScreenTypeLayout – Different Layouts for Each Device Type)--------------------
    // return ScreenTypeLayout.builder(
    //   mobile: (context) => MobileView(),
    //   tablet: (context) => TabletView(),
    //   desktop: (context) => DesktopView(),
    // );
    //-----------------(ResponsiveBuilder – Custom Logic for Size/Type/Orientation)---------------------
    // return ResponsiveBuilder(
    //   builder: (context, sizingInformation) {
    //     // Show/hide elements based on screen type
    //     bool isDesktop =
    //         sizingInformation.deviceScreenType == DeviceScreenType.desktop;

    //     return ElevatedButton(
    //       onPressed: isDesktop ? () => print('Enabled on Desktop') : null,
    //       child: Text('Download'),
    //     );
    //   },
    // );
    //-------------------(OrientationLayoutBuilder – Portrait vs Landscape)-------------------------
    // return OrientationLayoutBuilder(
    //   portrait: (context) => Center(child: Text('Portrait Mode')),
    //   landscape: (context) => Center(child: Text('Landscape Mode')),
    //   // mode: OrientationLayoutBuilderMode.landscape,
    // );
    //---------------------(SizingInformation)------------------------------------------------------
    // return ResponsiveBuilder(
    //   builder: (context, sizingInfo) {
    //     print(sizingInfo.screenSize); // Full device size
    //     print("sizingInfo.localWidgetSize --> ${sizingInfo.localWidgetSize} <--"); // Widget area constraints
    //     print(sizingInfo.deviceScreenType); // DeviceScreenType.mobile etc.
    //     return Text("data");
    //   },
    // );
    //---------------------------(Responsive Profile Page Example)---------------------------------------
     return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        if (sizingInfo.isDesktop) {
          return Row(
            children: [
              Expanded(child: Text("ProfileDetails()")),
              Expanded(child: Text("ProfileEditForm()")),
            ],
          );
        } else {
          return Column(
            children: [
              // ProfileDetails(),
              // ProfileEditForm(),
              Text("Mobile")
            ],
          );
        }
      },
    );
  }
}
