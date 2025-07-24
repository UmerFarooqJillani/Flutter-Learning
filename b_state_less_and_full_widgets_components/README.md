# <p align = "Center"> b_state_less_and_full_widgets_components </p>

--- 
## <p align="center">StatelessWidget</p>
--- 
## Why do we extend the 'Statelesswidget'
In Dart, to inherit behavior from a class, we use extends.
- 'MyApp' is a widget that has no state, and I want Flutter to manage and build it like: StatelessWidget
- This gives us access to the build() method which Flutter needs to call to render the UI.
--- 
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
--- 
## StatelessWidget Architecture (Developer Perspective)
```
    UI (What you design)
    └── Widget Tree (Static blueprint)
        └── Element Tree (Runtime instance of widgets)
                └── RenderObject Tree (Actual layout, paint, hit-test engine)
```
--- 
## When to Use 'StatelessWidget'
- The widget doesn’t depend on user input
- It doesn’t change during runtime
- It just returns UI
--- 
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
- It defines the first screen (or default/main route) of your app.
- It is the entry point widget when the app loads.
### 'Scaffold()' Complete Structure
'Scaffold' is a layout skeleton provided by Material Design that gives a structure like: 
```
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
```
You wrap most of your app 'screens' in a Scaffold.
More Details [Click Here](https://github.com/UmerFarooqJillani/Flutter-Learning/blob/main/b_state_less_and_full_widgets_components/lib/statelesswidgets.dart).

--- 
## 'child:' and 'children:' in flutter
### 'child:'
- when a widget expects only one child.
- This is common in layout widgets that wrap a single element.
### 'children:'
- For multiple widgets
- when a widget expects a list of widgets.
- Typically used in layout widgets like Row, Column, ListView, etc.
--- 
## <p align="center">StatefulWidget</p>
--- 
## When to Use a StatefulWidget?
- You want to change UI dynamically (e.g., button click updates a counter).
- You handle form inputs, switches, checkboxes, or user-driven changes.
- You need to manage lifecycle events (init, dispose, etc.)
- You want to fetch/update data (e.g., from API or database).
--- 
## Structure of a StatefulWidget
A StatefulWidget is split into two parts:
1. StatefulWidget class	
    - Configuration - receives parameters, sets up the UI
2. State class	
    - Holds data/state, and updates UI by calling setState()
    - Business logic + mutable state
--- 
## Why StatefulWidget is Split?
Flutter splits widgets into StatefulWidget and State:
- So Flutter can reuse the State object even if the parent widget rebuilds.
- This allows better performance and lifecycle control.
--- 
## StatefulWidget Architecture
```
        ┌────────────────────────┐
        │  StatefulWidget (UI)   │   ← UI Description
        └────────────┬───────────┘
                     │ calls
                     ▼ 
        ┌────────────────────────┐
        │    createState()       │   ← One-time call
        └────────────┬───────────┘
                     │ returns
                     ▼
        ┌────────────────────────┐
        │  State<extendsWidget>  │   ← Holds state & logic
        └────────────┬───────────┘
                     │ triggers via setState()
                     ▼
        ┌────────────────────────┐
        │     build() Method     │   ← Rebuilds UI
        └────────────────────────┘
```
--- 
## Flutter Rebuild Flow
```
      User clicks FAB (FoatingActionButton)
             │
             ▼
      Trigger setState()
             │
             ▼
      Flutter calls build()
             │
             ▼
      New widget tree rendered
             │
             ▼
      Updated UI on screen
``` 
--- 
## Components of StatefulWidget
### 'class CounterWidget extends StatefulWidget'
- Declares a widget that can change state.
- It inherits from StatefulWidget, so it must implement createState() method.
- Doesn't hold the state itself. Instead, representative to '_CounterWidgetState'.

### '@override State<CounterWidget> createState() => _CounterWidgetState();'
- It's called when the widget is first inserted into the widget tree.
- It returns the State class that contains the actual UI and logic for the widget.
- The _ before the name makes it private to this Dart file
- Private class:  It's a good practice to encapsulate the widget logic.
#### 'createState()'
- createState() connects your widget (_CounterWidget) to its logic/UI (CounterWidgetState)
- Tells Flutter which State class to use for this widget.
- Returns an instance of _CounterWidgetState.

### Why Do We Use State<CounterWidget>?
Because Flutter needs to know which widget this state belongs to. It uses this info internally to:
- Call lifecycle methods like **initState**, **build**, **dispose**.
- Rebuild the widget when **setState()** is called.

### 'int _counter = 0;'
- Actual state/variable that changes over time.

### 'setState(() { ... });'
- Triggers the widget to rebuild (calls build() again).
- Must wrap any change to state variables.

### 'build(BuildContext context)'
- The UI rendering method.
- Called again every time setState() is called.<br><br>
More Details [Click Here](https://github.com/UmerFarooqJillani/Flutter-Learning/blob/main/b_state_less_and_full_widgets_components/lib/statefulwidgets.dart).
--- 
## <p align = "Center"> Widget Tree </p>
--- 
The Widget Tree is a hierarchical structure of widgets in your app like a blueprint or skeleton. Every visual component on the screen (buttons, text, containers, images, layout, etc.) is a widget.
### Real Code and Matching Widget Tree
```
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());        // Root Widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```
Tree Form of the Above Code:
```
    MyApp (StatelessWidget)
    └── MaterialApp
        ├── title: 'Flutter Demo'
        └── home: MyHomePage (StatefulWidget)
            └── Scaffold
                ├── appBar: AppBar
                │   └── Text(widget.title)
                ├── body: Center
                │   └── Column
                │       ├── Text('You have pushed the button this many times:')
                │       └── Text('$_counter')
                └── floatingActionButton: FloatingActionButton
                    ├── onPressed: _incrementCounter
                    └── child: Icon(Icons.add)
```
--- 
### Why Is It Called a "Tree"?
Just like a tree:
- There's a root (usually MaterialApp).
- Every widget can have branches (children widgets).
- Those branches can have sub-branches (grandchildren), and so on.<br>
It grows top-down, and Flutter builds and renders it this way.
--- 
### What is the Flutter Tree Structure?
Flutter internally maintains 3 parallel trees:
- **Widget Tree**	Blueprint / structure (your code)
- **Element Tree**	Connects widgets to the render system (runtime instance)
- **Render Tree**	Actual objects that handle layout, painting, etc.
--- 
### Flutter Trees Example
Here's an example of a counter app using StatefulWidget:
``` 
class CounterWidget extends StatefulWidget {
  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => counter++),
        child: Icon(Icons.add),
      ),
    );
  }
}
``` 
1. Widget Tree
``` 
CounterWidget (StatefulWidget)
 └── Scaffold
      ├── Center
      │    └── Text('$counter')
      └── FloatingActionButton
           └── Icon(Icons.add)
``` 
2. Element Tree
``` 
StatefulElement (CounterWidget)
 └── ScaffoldElement
      ├── CenterElement
      │    └── TextElement ("0")
      └── FABElement
           └── IconElement
``` 
3. RenderObject Tree
``` 
RenderView
 └── RenderBox (Scaffold)
      ├── RenderBox (Text)
      └── RenderBox (FloatingActionButton)
``` 
--- 
