/*
--> flutter_screenutil
    flutter_screenutil is a Flutter package that helps make your UI responsive 
    across screen sizes by:
      - Scaling dimensions (width, height, radius, fontSize)
      - Adapting padding/margins
      - Adjusting font scaling
      - Supporting high-resolution screens and split mode

--> Usage & Properties

    -> 100.w	
      - Scales width based on screen	
      - Use for width of containers, buttons, cards

    -> 200.h	
      - Scales height based on screen	
      - Use for vertical sizes like boxes, spacers

    -> 16.sp	
      - Scales font size	
      - Use for TextStyle(fontSize:...)

    -> 20.r	
      - Scales radius or edge size	
      - Use for BorderRadius.circular(...)

    -> EdgeInsets.all(16.w)	
      - Scales padding	
      - For padding/margin inside containers

    -> ScreenUtil().screenWidth	
      - Device screen width	
      - For layout calculations

    -> ScreenUtil().screenHeight	
      - Device screen height	
      - For layout calculations

    -> ScreenUtil().statusBarHeight	
      - Status bar height	
      - To avoid overlapping UI

    -> ScreenUtil().bottomBarHeight	
      - Bottom navigation height	
      - For safe UI space 
    
    -> ScreenUtil().scaleWidth	
      - Current scale for width	
      - Used internally for .w

    -> ScreenUtil().scaleHeight	
      - Current scale for height	
      - Used internally for .h

    -> ScreenUtil().radius	
      - Scale factor for radius	
      - Used for .r values
  
*/
import 'package:flutter/material.dart';
// first for all add the dependencies
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ make sure this works

/*
--> ScreenUtilInit — Core of flutter_screenutil
  - This is the entry point where you define how your app will scale UI based 
    on device screen size.
  -------------
  - Properties:
  -------------
    ----------------------------------
    -> designSize: Size(width, height)
    ----------------------------------
      - All measurements in the app (widths, heights, paddings, font sizes) are based on a 
        mockup (model or replica of a machine or structure, used for instructional or 
        experimental purposes) created at 375×812 pixels. 
        e.g:
            ScreenUtilInit(
              designSize: Size(375, 812),
              ...
            )
      - Now scale everything based on the current device’s screen size.

      - Why Size(375, 812) Is Common:
      -------------------------------
        Because many UI designers (Figma, Adobe XD, Sketch) use iPhone 11 Pro as their base mockup. 
        It has:
          - 375 logical pixels wide
          - 812 logical pixels tall
        This size is:
          - Balanced (not too small or large)
          - A good middle ground for mobile screens
          - Easy to scale up or down across devices
        
      - Can You Use Other Sizes?
      --------------------------
        - You use the same design size as your mockup (e.g., Figma used 414x896)	
          - Good?
            ✅ Best
          - Reason
            Matches scale exactly

        - You invent your own size like Size(400, 800)	
          - Good?
            ⚠️ Risky
          - Reason
            Might scale weirdly on real phones

        - You use a tablet size like Size(768, 1024) for mobile app	
          - Good?
            ❌ Bad
          - Reason
            Scaling will be too small for phones

        - You use very small size like Size(320, 568) (iPhone 5)	
          - Good?
            ⚠️ Not ideal
          - Reason
            Too small → everything scales too big

      --------------------------------------------------------------------
      ✅ For cross-platform apps (mobile + web + tablet + desktop), there is no perfect 
      universal designSize, but the safest and most balanced base is:
        designSize: Size(390, 844)
      Slightly larger than the old 375x812
      --------------------------------------------------------------------

    ---------------------------
    -> minTextAdapt: true/false
    ---------------------------
      - Forces text to never scale below your design text size, even if the screen is tiny.
      - When to Use:
        - When you want your text to always be readable and proportionally correct
        - Great for ensuring visual consistency in smaller devices
      - Set to false if:
        - You want small screens to show smaller fonts to save space (not common)

    ------------------------------
    -> splitScreenMode: true/false
    ------------------------------
      - Enables support for multi-window / split-screen mode on tablets or foldables.
      - When to Use:
        - On tablets or when your app is likely to run in split-view mode
        - Ensures layout stays consistent in smaller "views" of large screens

    ------------------------------
    -> builder: (context, child)
    ------------------------------
      - This wraps your root widget (usually MaterialApp) after initializing ScreenUtil.

    
*/
void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(home: HomeScreen());
      },
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive UI',
          style: TextStyle(fontSize: 20.sp), // scalable font
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // scalable padding
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h), // responsive height

              Container(
                width: 300.w,
                height: 200.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                    20.r,
                  ), // responsive radius
                ),
                child: Center(
                  child: Text(
                    'Responsive Box',
                    style: TextStyle(
                      fontSize: 18.sp, // responsive font size
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200.w, 50.h), // responsive button size
                ),
                onPressed: () {},
                child: Text('Click Me', style: TextStyle(fontSize: 16.sp)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
