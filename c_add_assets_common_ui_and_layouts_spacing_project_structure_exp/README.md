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


#### Should You Edit lib/

### 📂 linux/
#### Purpose:

#### Should You Edit linux/
