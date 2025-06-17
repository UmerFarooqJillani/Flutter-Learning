# <p align = "Center"> b_state_less_and_full_widgets_components </p>

## Why do we extend the 'Statelesswidget'
In Dart, to inherit behavior from a class, we use extends.
- 'MyApp' is a widget that has no state, and I want Flutter to manage and build it like: StatelessWidget
- This gives us access to the build() method which Flutter needs to call to render the UI.
## StatelessWidget Internal Architecture
```
      Widget Tree (Code Layer)
          ↓
      StatelessWidget
          ↓
      Element (StatelessElement)
          ↓
      RenderObject (e.g. RenderParagraph for Text)
```
## When to Use 'StatelessWidget'
- The widget doesn’t depend on user input
- It doesn’t change during runtime
- It just returns UI
## Components of StatelessWidget
### 'class MyApp extends StatelessWidget'
- You are creating a custom widget named 'MyApp'.
- You 'extend StatelessWidget' because this widget’s output doesn’t change.
- Every custom widget in Flutter must extend either StatelessWidget or StatefulWidget.
### 'const MyApp({super.key})'
- A constructor.
- 'const' makes the widget compile-time constant (more efficient).
- A 'Key' is used to uniquely identify widgets in the widget tree.
- It helps Flutter compare old vs new widgets during rebuilds.
- 'super.key' passes the key to the base class for widget identification and optimization.
- '{}' The parameter 'key' is optional, not required.<br>
The caller can write 'MyApp(key: someKey)' or just 'MyApp()'
### 'Widget build(BuildContext context) {}' 
- Every widget must override the build method.
- This method returns the UI widget tree. 
- 'build()' gets called when Flutter needs to render this widget.
- 'BuildContext context' It's the link to the widget tree above this widget.
    With it, you can access theme, media queries, or ancestor widgets.
- 'context'  Provides info about location in the widget tree.
### 'MaterialApp()'
- Wraps your whole app with Material Design environment (e.g., themes, routing, Directionality).
### 'debugShowCheckedModeBanner: false'
- Removes the red "DEBUG" banner (a banner appears to indicate you're not in production)
- Setting this to false in MaterialApp hides that banner.
### 'home: '
- home is a named parameter of the MaterialApp widget.
- It defines the first screen (or main route) of your app.
- It is the entry point widget when the app loads.
### 'Scaffold()' Complete Structure
        'Scaffold' is a layout skeleton provided by Material Design that gives a structure like: 
          Scaffold(
            appBar: AppBar(...),            // Header bar
            body: Center(...),              // Main content
            drawer: Drawer(...),            // Left side navigation
            endDrawer: Drawer(...),         // Right side navigation
            floatingActionButton: FAB(...), // Circular action button
            bottomNavigationBar: ...,       // Bottom menu
            bottomSheet: ...,               // Permanent footer section
            backgroundColor: Colors.white,  // Page background
            resizeToAvoidBottomInset: true, // Adjust for keyboard
          )
        You wrap most of your app 'screens' in a Scaffold