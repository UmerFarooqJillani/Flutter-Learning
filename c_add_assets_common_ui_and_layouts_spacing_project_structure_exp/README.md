# <p align="center"> c_add_assets_common_ui_and_layouts_spacing_project_structure_exp <p>

## Default Flutter Project Structure

### 📂 .dart_tool/ 
**Purpose:**<br>
It stores project-specific build info, package configurations, and tool caches used internally by the Dart/Flutter ecosystem.<br><br>
**Should You Edit .dart_tool/**<br>
No
### 📂 .idea/
**Purpose:**<br>
The .idea/ folder stores project-specific settings for Android Studio or IntelliJ IDE.
It contains configuration files like:
- Code style
- Project settings
- Plugin preferences
- Run configurations
- Workspace settings<br><br>
**Should You Edit .idea/**<br>
No – Usually not.
### 📂 android/
**Purpose:**<br>
- Contains native Android project code that runs your Flutter app on Android devices.
- Acts like a normal Android project (if you were building an app using Java/Kotlin).
- Useful for platform-specific code, plugins, SDK configs, Gradle builds, permissions, etc.<br><br>
**Should You Edit android/** <br>
Yes, if...
- You need platform-specific Android functionality.
- You need permissions, services, native integrations.<br>
No, if...
- You're only working with Flutter UI.
- You're not using platform channels or SDKs.
### 📂 ios/
**Purpose:**<br>
- The ios/ directory contains the iOS-native side of your Flutter app. It allows Flutter to integrate with iOS devices using native Swift/Objective-C code and the Xcode build system.
- Flutter UI runs the same on all platforms, but this folder handles platform-specific features (notifications, permissions, splash screen, etc.) for iOS.<br><br>
**Should You Edit ios/** <br>
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
**Purpose:**<br>

<br>

**Should You Edit lib/** <br>

### 📂 linux/
**Purpose:**<br>
<br>

**Should You Edit linux/** <br>
