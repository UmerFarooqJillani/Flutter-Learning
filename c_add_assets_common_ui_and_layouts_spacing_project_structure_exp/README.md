# <p align="center"> c_add_assets_common_ui_and_layouts_spacing_project_structure_exp <p>

--- 
## <p align="center"> Default Flutter Project Structure </p>
--- 
### 📂 .dart_tool/ 
#### Purpose:
It stores project-specific build info, package configurations, and tool caches used internally by the Dart/Flutter ecosystem.
#### Should You Edit .dart_tool/
No
### 📂 .idea/
#### Purpose:
The .idea/ folder stores project-specific settings for Android Studio or IntelliJ IDE.
It contains configuration files like:
- Code style
- Project settings
- Plugin preferences
- Run configurations
- Workspace settings
#### Should You Edit .idea/
No – Usually not.
### 📂 android/
#### Purpose:
- Contains native Android project code that runs your Flutter app on Android devices.
- Acts like a normal Android project (if you were building an app using Java/Kotlin).
- Useful for platform-specific code, plugins, SDK configs, Gradle builds, permissions, etc.
#### Should You Edit android/
##### Yes, if...
- You need platform-specific Android functionality.
- You need permissions, services, native integrations.
##### No, if...
- You're only working with Flutter UI.
- You're not using platform channels or SDKs.
### 📂 ios/
#### Purpose:
- The ios/ directory contains the iOS-native side of your Flutter app. It allows Flutter to integrate with iOS devices using native Swift/Objective-C code and the Xcode build system.
- Flutter UI runs the same on all platforms, but this folder handles platform-specific features (notifications, permissions, splash screen, etc.) for iOS.
#### Should You Edit ios/
``` 
|------------------------------------------------------------------------------------------------|
| Use Case                                  | What You Do                                        |
| ----------------------------------------- | -------------------------------------------------- |
| Add iOS permissions (camera, internet)    | Edit `Info.plist`.                                 |
| Add native iOS libraries (Firebase, etc.) | Modify `Podfile`, run `pod install`.               |
| Customize launch screen                   | Edit `LaunchScreen.storyboard`.                    |
| Add App Icon                              | Modify `Assets.xcassets`.                          |
| Use Swift/Obj-C code                      | Write native platform code in `AppDelegate.swift`. |
|------------------------------------------------------------------------------------------------|
``` 
### 📂 lib/
#### Purpose:
- The lib/ folder is where you write all your Flutter/Dart app code — UI, business logic, navigation, and features.
- This is the only folder compiled to native code across all platforms
#### Should You Edit lib/
Yes
### 📂 linux/
#### Purpose:
- The linux/ directory contains native platform-specific code and project setup files required to build, run, and package Flutter apps for Linux desktops.
- This is only used if you are targeting desktop platforms, specifically Linux.
#### Should You Edit linux/
Building for Linux desktop --> Yes<br>
Mobile-only Flutter app --> No<br>
Using plugins that require platform-specific native code --> Yes (for Linux-specific plugins)<br>
You plan to distribute .deb or .AppImage files --> Yes<br>
### 📂 macos/
#### Purpose:
- Contains everything needed to build and run your Flutter app on macOS desktop.
- Includes platform-specific Swift code, Xcode project files, window settings, app icons, etc.
#### Should You Edit macos/
##### Yes, if:
- You're building a macOS desktop app.
- You want to customize window size, icons, menus, permissions, etc.
##### No, if:
- You’re only targeting mobile or web platforms.
- You don't need desktop support.
### 📂 test/
#### Purpose:
- Holds all the unit tests, widget tests, and integration tests for your app.
- Allows you to automate testing and verify that your code behaves as expected.
#### Should You Edit test/
##### Yes, highly recommended.
- Write tests for logic, widgets, UI, and business rules.
- No, only if you're just prototyping or doing a small demo (but not best practice).
- **Example file:** test/widget_test.dart (default test template when app is created).
### 📂 web/
#### Purpose:
- Contains files to build and run your Flutter app as a web app in browsers (Chrome, Firefox, Safari, etc.).
- Uses HTML, CSS, and JavaScript compiled from Dart/Flutter.
#### Should You Edit web/
##### Yes, if:
- You're developing for web browsers.
- You need to add favicon, update index.html, or configure web-specific settings.
##### No, if:
- You're building only for mobile or desktop.
### 📂 windows/
#### Purpose:
- Contains files to build and run your Flutter app on Windows desktop.
- Includes native C++ files, project settings, resource icons, and configurations for Windows.
#### Should You Edit windows/
##### Yes, if:
You're building a desktop app for Windows.
You want to customize app behavior, icons, permissions, or other Windows-specific settings.
##### No, if:
You're targeting only Android/iOS/web/macOS.
### 📄 .metadata/
#### Purpose:
- Stores internal metadata about the Flutter project.
- Keeps track of:
    - Flutter SDK version
    - Project type (module, plugin, app)
    - Toolchain usage
- Used internally by the Flutter CLI to optimize tooling and compatibility.
#### Should You Edit .metadata/
##### No.
- It is auto-generated and managed by Flutter.
### 📄 analysis_options.yaml/
#### Purpose:
- Defines static code analysis rules (also called linter rules) for Dart.
- Helps you:
    - Enforce code style (e.g., no unused imports, type safety).
    - Maintain clean, error-free code.
    - Improve readability and consistency.
#### Should You Edit analysis_options.yaml/
##### Yes, optionally.
- Add or remove lint rules based on your team or project coding standards.
- You can extend from predefined sets (e.g., package:flutter_lints/flutter.yaml).<br>
Example:
```
include: package:flutter_lints/flutter.yaml
linter:
  rules:
    avoid_print: true
    always_declare_return_types: true
```
### 📄 pubspec.lock/
#### Purpose:
- Locks the package versions for all your app dependencies.
- Ensures that everyone on your team uses the exact same package versions.
- Created automatically when you run flutter pub get.
#### Should You Edit pubspec.lock/
##### No, do not manually edit.
- It is auto-managed.
- Use flutter pub get or flutter pub upgrade to update package versions.
##### Yes (indirectly):
- You may delete it to reset your dependency tree, but don’t change contents manually.
### 📄 pubspec.yaml/
#### Purpose:
- This is the **heart** of your Flutter app’s configuration.
- Manages:
    - App name, description, version
    - Dependencies (http, flutter, provider, etc.)
    - Assets (images, fonts)
    - Environment constraints (Dart SDK version)
#### Should You Edit pubspec.yaml/
##### Yes!
You’ll edit this file often to:
- Add dependencies
- Register assets or fonts
- Configure app metadata
- Always run flutter pub get after changing it.
--- 
## <p align="center"> Add and Display Images </p>
--- 
### Assets (local images stored in your project)
1. Create an assets/ folder: 
```
    my_flutter_app/
    ├── assets/
    │   └── images/
    │       └── my_image.png
```
2. Register the image in **pubspec.yaml**
```
flutter:
    assets:
        - assets/images/my_image.png   # For Specific Images
``` 
You can include all images in a folder:
```
  assets:
    - assets/images/
```
3. Use Image.asset() in your widget
```
    Image.asset('assets/images/my_image.png')
```
### Network (images loaded from the internet)
```Dart
Image.network(
  'https://example.com/image.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)
```
### Memory or File (advanced, usually with plugins like image_picker, file, etc.)
You can use the **cached_network_image** package for caching & placeholders

--- 
## <p align="center"> Custom fonts in Flutter</p>
--- 
### Internal Fonts (Local Fonts / Custom Fonts)
- Add font files to your project
- Put your **.ttf** font files inside a folder like:
``` 
    my_flutter_app/
    ├── assets/
    │   └── fonts/
    │       ├── Poppins-Regular.ttf
    │       └── Poppins-Bold.ttf
```
- Register fonts in pubspec.yaml
``` 
flutter:
  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
        - asset: assets/fonts/Poppins-Bold.ttf
          weight: 700
``` 
- Use the custom font in Text
```
    Text(
      'Hello World!',
      style: TextStyle(
        fontFamily: 'Poppins',   
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    )
``` 
### External Fonts (Google Fonts Package)
- Go to 
```
    https://pub.dev/packages/google_fonts/install
```
or run 
```
flutter pub add google_fonts
```
- This will add a line like this to your package's **pubspec.yaml** (and run an implicit flutter pub get):
```
    dependencies:
      google_fonts: ^6.2.1   # (Add dependencies)
```
- Import it 
``` 
import 'package:google_fonts/google_fonts.dart';
```

--- 
## <P align="center"> Even Spacing Widgets </p>
--- 
### Padding
- Adds space inside the widget’s boundary (between the widget and its child).
```dart
Padding(
  padding: EdgeInsets.all(16.0), // uniform padding
  child: Text('Padded Text'),
)
// EdgeInsets.all(value) → same padding on all sides
// EdgeInsets.symmetric(horizontal: 10, vertical: 20)
// EdgeInsets.only(left: 10, right: 5)
``` 
### Margin (via Container)
- Adds space outside the widget, between the widget and other siblings.
```Dart
Container(
  margin: EdgeInsets.all(20), // outside spacing
  child: Text('Text with Margin'),
)
```
### SizedBox
- Adds fixed-size spacing or invisible box between widgets.
```dart
SizedBox(height: 20), // vertical space
SizedBox(width: 10),  // horizontal space
``` 
- Or use it to wrap a widget and give it a fixed size:
``` dart
SizedBox(
  width: 100,
  height: 50,
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Fixed Size Button'),
  ),
)
``` 
### MainAxisAlignment & CrossAxisAlignment
- Used in Row, Column, and Flex widgets to control spacing between children.<br>
Example:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // space between children and the main axis of row are horizontally 
  crossAxisAlignment: CrossAxisAlignment.center,     // alignment horizontally and the cross axis of row are vertically
  children: [
    Text("One"),
    Text("Two"),
    Text("Three"),
  ],
)
``` 
### Spacer Widget
- Creates flexible empty space between widgets in a Row or Column.
``` dart
Row(
  children: [
    Text("Left"),
    Spacer(),              // pushes the next widget to the end
    Text("Right"),
  ],
)
``` 
### Align Widget
- Used to align a widget within its parent and can affect positioning (acts like spacing sometimes).
- It does not create space between widgets but rather positions a widget inside its parent container.
``` dart
Align(
  alignment: Alignment.bottomRight,
  child: Text("Aligned Text"),
)
``` 
### Expanded Widget
- Expands a child of a Row, Column, or Flex to fill the remaining space.
```dart
Row(
  children: [
    Expanded(child: Text("This fills available space")),
    Icon(Icons.arrow_forward),
  ],
),
```
---
# <p align="center">a </p>
--- 
