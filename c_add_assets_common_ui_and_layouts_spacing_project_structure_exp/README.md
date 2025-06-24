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
## <p align="center">All Types of Buttons in Flutter</p>
--- 
### `ElevatedButton`  
- Raised button with elevation (3D look) 
```dart
ElevatedButton(
  onPressed: () {
    print("Clicked");
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 5,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: Text("Elevated"),
)
```
### `TextButton`          
- Flat button without background
```dart
TextButton(
  onPressed: () {},
  child: Text("Text Button"),
)
```
### `OutlinedButton`        
- Bordered button without background
```dart
OutlinedButton(
  onPressed: () {},
  child: Text("Outlined"),
)
```
### `IconButton`        
- Button with only an icon
```dart
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {},
  iconSize: 30,
  color: Colors.red,
)
```         
### `FloatingActionButton` 
- Circular button used for main actions
```dart
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
  backgroundColor: Colors.orange,
  tooltip: "Add",
)
```
### `DropdownButton`        
- Button that shows a dropdown menu
```dart
DropdownButton<String>(
  value: selectedValue,
  items: ['One', 'Two', 'Three'].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedValue = value!;
    });
  },
)
```
### `PopupMenuButton`       
- Button that shows a popup menu
```dart
PopupMenuButton<String>(
  onSelected: (value) {
    print("Selected: $value");
  },
  itemBuilder: (context) => [
    PopupMenuItem(value: "Edit", child: Text("Edit")),
    PopupMenuItem(value: "Delete", child: Text("Delete")),
  ],
)
```
#### Styling Buttons
```dart
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.green),
    // used WidgetStatePropertyAll() instead of MaterialStateProperty.all() because it's old
    foregroundColor: MaterialStateProperty.all(Colors.white),   
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  ),
  onPressed: () {},
  child: Text("Styled Button"),
)
```
--- 
## <p align="center"> widget-based layout system </p>
--- 
### What is Layout in Flutter?
Layout is how widgets are arranged on the screen (horizontally, vertically, aligned, spaced, etc.). Flutter uses a flexible box model based on the widget tree.
### Container Widget
- A box that combines multiple layout, decoration, position, and transform properties.
- Often used as a wrapper.
```dart
Container(
  width: 200,
  height: 100,
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(16),
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Colors.blue,  
    borderRadius: BorderRadius.circular(12),
    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey)],
  ),
  child: Text('Container', style: TextStyle(color: Colors.white)),
)
```
### Row Widget
- Places children horizontally (from left to right by default).
- Uses flex layout model (children can expand, shrink, align).
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Icon(Icons.home),
    Icon(Icons.favorite),
    Icon(Icons.settings),
  ],
)
```
### Flex Widget
- Base class for Row and Column.
- Used when you want custom axis control (horizontal or vertical layout dynamically).
```dart
Flex(
  direction: Axis.horizontal,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Icon(Icons.access_alarm),
    Icon(Icons.backup),
    Icon(Icons.camera),
  ],
)
```
### Column Widget
- A widget that lays out its children vertically (from top to bottom).
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,  // Vertical alignment
  crossAxisAlignment: CrossAxisAlignment.center, // Horizontal alignment
  children: <Widget>[
    Text('Hello'),
    ElevatedButton(onPressed: () {}, child: Text('Click')),
  ],
)
``` 
### Stack Widget
- A widget that overlays children on top of each other.
- Children are positioned relative to each other (like **z-index in CSS**).
```dart
Stack(
  children: [
    Container(width: 200, height: 200, color: Colors.blue),
    Positioned(
      bottom: 10,
      right: 10,
      child: Icon(Icons.star, color: Colors.white),
    ),
  ],
)
```
### Flutter scrolling UI widgets
#### ListView (Scrollable vertical list)
- A scrollable linear list of widgets.
- Used when you have a list of items like messages, menu items, contacts, etc.
##### Common Constructors:
- ListView() – Static list
- ListView.builder() – Dynamic / Lazy list
- ListView.separated() – With custom dividers
- ListView.custom() – Advanced use cases
#### 
```dart
ListView.builder(   // 	A lazy-loading list that only builds what’s visible on screen.
  itemCount: 5,     // You want 5 items in total.
  itemBuilder:      // A callback function that builds each item on demand.
  (context, index) {  // The build context (position of widget in the tree).
    //  The current list item number (0 to 4).
    return ListTile(   // A ready-made material list item widget.
      title: Text("Item $index"),
    );
  },
)
```
- This creates a scrollable list with 5 dynamic list tiles.
#### ListView() – Static List
- Use when you have a small fixed number of widgets.
- Not recommended for large/dynamic lists.
- Supports any widgets (not just ListTile).
##### When to use:
- Short menus
- Static forms
- About pages 
```dart
ListView(
  children: [
    ListTile(title: Text("Item 1")),
    ListTile(title: Text("Item 2")),
    ListTile(title: Text("Item 3")),
  ],
)
``` 
#### ListView.builder() – Lazy/Dynamic List
- Builds only visible items (improves performance).
- Great for large or dynamic data (e.g., database, API).
- Most commonly used in real-world apps.
##### When to use:
- Chat apps
- News feeds
- Long product lists
```dart
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) => Text("Item $index"),
)
```
#### ListView.separated() – With Custom Dividers
- Same as builder, but with separators between items.
- Allows you to insert dividers, spacing, or custom widgets.
- Not for complex UI sections (use CustomScrollView for that).
##### When to use:
- Settings screens
- Menus with spacing/dividers
- Lists with clear visual separation
```dart
ListView.separated(
  itemCount: 10,
  itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
  separatorBuilder: (context, index) => Divider(color: Colors.grey),
)
```
#### ListView.custom() – Fully Customizable
- Most advanced and powerful version.
- Gives you full control using **SliverChildListDelegate** or **SliverChildBuilderDelegate**.
- Use only when you need fine-tuned rendering behavior or integrating with **CustomScrollView**.
##### When to use:
- Custom scroll behavior
- Merging with slivers (advanced UIs)
- Optimized large lists with custom needs
```dart
ListView.custom(
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) => Text("Item $index"),
    childCount: 5,
  ),
)
```
##### property-by-property for ListView, GridView
###### scrollDirection
- Determines the direction of scrolling: vertical (default) or horizontal.
```dart
ListView(
  scrollDirection: Axis.horizontal, // Axis.vertical by default
  children: [
    Container(width: 150, color: Colors.red),
    Container(width: 150, color: Colors.green),
    Container(width: 150, color: Colors.blue),
  ],
)
``` 
###### shrinkWrap
- Tells the ListView to take up only the space it needs, rather than expanding to fill all available space.
- Needed when using ListView inside a Column or other scrollable to avoid layout errors.
- Without it, you'll see: Vertical viewport was given unbounded height.
```dart
Column(
  children: [
    Text("Top Section"),
    ListView(
      shrinkWrap: true, // Important!
      children: List.generate(3, (i) => Text("Item $i")),
    ),
    Text("Bottom Section"),
  ],
)
```
###### physics
- Controls scroll behavior — bounce, clamping, never scroll, etc.
- To customize scroll feel per platform or app type.
- To disable scroll in certain areas.
```dart
ListView(
  physics: BouncingScrollPhysics(), // Smooth iOS bounce
  children: List.generate(10, (i) => ListTile(title: Text("Item $i"))),
)
```
###### reverse
- Reverses the list — starts from the bottom to top instead of top to bottom.
- Chat apps or comment threads where newest appears at bottom.
```dart
ListView(
  reverse: true, // Reverses scroll direction
  children: List.generate(5, (i) => ListTile(title: Text("Item $i"))),
)
```
###### ListTile → (Pre-styled list item widget)
- A ready-made tile widget used inside ListView.
- Good for menus, settings, contact cards, etc.
``` dart
ListTile(
  leading: Icon(Icons.person),   // icon/image at start
  title: Text("Umer"),    // main text
  subtitle: Text("Flutter Developer"),   // below main text
  trailing: Icon(Icons.arrow_forward),   // icon/button at end
  onTap: () => print("Tapped"),     // click action
)
```
###### SingleChildScrollView with Column
- SingleChildScrollView is a scrollable widget that allows a single child to be scrolled if it's too large to fit in the available space (e.g., on smaller screens or when the keyboard appears).
- Wraps a single widget (usually a Column) to make it scrollable.
- Especially useful when dealing with forms, responsive UIs, or screens that may overflow vertically.
```dart
SingleChildScrollView(
  scrollDirection: Axis.vertical  , // or Axis.horizontal
  child: Column(
    children: [
      Text("Title", style: TextStyle(fontSize: 32)),
      Image.asset("assets/banner.png"),
      Padding(
        padding: EdgeInsets.all(16),
        child: Text("Long paragraph..."),
      ),
    ],
  ),
)
``` 
###### GridView → (Scrollable grid of items)
A GridView displays widgets in a scrollable grid (rows and columns). It's perfect for galleries, product layouts, dashboard tiles, etc.
- GridView.count → Fixed number of columns
```dart
GridView.count(
  crossAxisCount: 2,
  children: List.generate(6, (index) {
    return Card(child: Center(child: Text('Item $index')));
  }),
)
```
- GridView.extent → Max width per item
```dart
GridView.extent(
  maxCrossAxisExtent: 150, // Each item max 150 px wide
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  padding: EdgeInsets.all(8),
  children: List.generate(
    10,
    (index) => Container(
      color: Colors.blue[100 * (index % 9)],
      child: Center(child: Text('Box $index')),
    ),
  ),
)
```
- GridView.builder → Lazy grid (For long or infinite lists)
```dart
/*
-> What is a SliverGridDelegate?
    In Flutter, Sliver is a portion of a scrollable area. A SliverGridDelegate defines how grid tiles (items) are laid out — i.e., how many columns, how big each tile is, how much space is between them.
*/
GridView.builder(
  itemCount: 20,
  // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( // Create a grid where each item's max width is specified
  // maxCrossAxisExtent: 200,     // Max width per item
  // mainAxisSpacing: 10.0,       // Vertical space
  // crossAxisSpacing: 10.0,      // Horizontal space
  // childAspectRatio: 1.0,       // width / height ratio
  // ),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //	Create a grid with a fixed number of columns
    crossAxisCount: 2,    // Number of columns
    mainAxisSpacing: 10,  // Vertical space between items
    crossAxisSpacing: 10,   // Horizontal space between items
    childAspectRatio: 1.0,   // width / height ratio (1.0 = square)
  ),
  itemBuilder: (context, index) {
    return Container(
      color: Colors.purple[100 * (index % 9)],
      child: Center(child: Text('Item $index')),
    );
  },
)
```
##### CustomScrollView + Slivers → (Custom complex scrolling)
- **CustomScrollView** is a scrollable area that allows you to use slivers, which are portions of scrollable content. It’s used when you want advanced, flexible scroll behaviors (like collapsible app bars, grids, dynamic headers, etc.).
  - CustomScrollView is ideal for complex scroll-based UIs like:
    - Collapsing headers (SliverAppBar)
    - Lists + Grids combined
    - Parallax effects
    - Sticky headers
- **Slivers** are scrollable areas that "slide" in and out of view as the user scrolls. You can combine multiple slivers in a CustomScrollView.
  - The term sliver means "sliding portion" — it’s a piece of a scrollable area.
  - Instead of using **ListView**, **GridView**, or **Column**, you break your UI into slivers, which behave efficiently inside a scroll.
###### SliverAppBar — Collapsible AppBar & SliverList — Scrollable List of Widgets
- Provides a flexible, scroll-aware AppBar that can expand, collapse, pin, and show a flexible background.
<br>

- **SliverList:** Use it for performance when rendering long lists.
  - **SliverChildListDelegate([...])** for a fixed list
  - **SliverChildBuilderDelegate(...)** for large/dynamic lists
```dart
CustomScrollView(
  slivers: [
    SliverAppBar(
      //	Keeps app bar visible at top even after scroll
      pinned: true,   	//Keeps app bar visible when collapsed (true = sticky)
      expandedHeight: 200, // Max height when fully expanded
      title: Text('SliverAppBar'), 
      floating: true, // Appears immediately when user scrolls up
      snap: false, // Works with floating
      flexibleSpace: FlexibleSpaceBar(   // Widget like FlexibleSpaceBar for background/title
        title: Text('Collapsing Title'),
        background: Image.asset('assets/images/Asset_18.png', fit: BoxFit.cover),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text("Item $index")),
        childCount: 20,
      ),
    ),
  ],
)
```
###### SliverGrid — Grid Layout in Sliver
- Grid Delegate Types:
  - SliverGridDelegateWithFixedCrossAxisCount (e.g. 2 columns)
  - SliverGridDelegateWithMaxCrossAxisExtent (e.g. max 200px width)
```dart
body: CustomScrollView(
  slivers: [
    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => Container(
          color: Colors.amber,
          child: Center(child: Text('Item $index')),
        ),
      ),
    ),
  ],
),
```
###### SliverToBoxAdapter — Add normal widgets
- Use when you want to include a normal (non-sliver) widget:
```dart
SliverToBoxAdapter(
  child: Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('I am a regular widget'),
  ),
)
```
--- 
<!-- <p align="center"> [Icons In Dart]() </p>
---  -->



 