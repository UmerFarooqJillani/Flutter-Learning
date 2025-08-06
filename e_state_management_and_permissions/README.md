# <p align="center"> e_state_management_and_permissions </p>

## Why Do We Need State Management?
As your app grows, managing state in just one widget or with setState() becomes:
- Repetitive
- Confusing
- Difficult to debug
- Hard to scale<br>
**That’s where state management comes in.**
- State management is how you organize, update, and share app data across widgets in a clean and predictable way.

## Why Use State Management?
Let’s say you fetch a list of products from an API and display them across:
- A product list screen
- A cart screen
- A checkout screen<br>
**Without state management:**
- You’d pass data manually between widgets
- You’d duplicate logic
- Changes wouldn’t auto-update UI<br>
**With state management (e.g., Provider or Riverpod):**
- You store the product list in a central provider
- Any widget can access and update it
- UI auto-reacts when data changes

## When, Why, and What state management tool to use in real-world Flutter projects
You don’t need a state management package for everything. Start by asking:
- Does this data change over time?
- Does this data need to be shared across multiple widgets/screens?<br>
**If yes, you need state management. If no, local setState() is fine.**

## Real-World Decision Table (with Use Cases)
1. **Situation**<br>
Button toggle / counter / local form field
    - **Why You Need State**<br>
    Only 1 widget updates itself
    - **Best Solution**<br>
    setState()<br>
2. **Situation**<br>
Pass data from one screen to another
    - **Why You Need State**<br>
    Can’t use setState() across screens
    - **Best Solution**<br>
    Provider, Riverpod
3. **Situation**<br>
Login/logout & user session across app
    - **Why You Need State**<br>
    Shared across screens, needs persistence
    - **Best Solution**<br>
    Provider, Riverpod, Bloc
4. **Situation**<br>
Form validation with multiple fields
    - **Why You Need State**<br>
    You need to show real-time error states, manage input logic
    - **Best Solution**<br>
    Cubit, Formz, Provider
5. **Situation**<br>
API data (e.g., product list)
    - **Why You Need State**<br>
    Used in many places (list, detail, cart)
    - **Best Solution**<br>
    Riverpod, Bloc, GetX
6. **Situation**<br>
Dark mode / language switcher
    - **Why You Need State**<br>
    Global app-level UI state	
    - **Best Solution**<br>
    Provider, Riverpod, Bloc

## Why Each Tool?
### ✅ setState()
**When:** Local widget changes (e.g., toggles, counters)<br>
**Why:** Lightweight and easy
### ✅ Provider
**When:** Small–medium apps, sharing state like user session, app theme<br>
**Why:** Simple, official Flutter package, beginner-friendly
### ✅ Riverpod
**When:** Growing projects or multiple teams<br>
**Why:** Safer, cleaner, testable than Provider (no context dependency)
### ✅ Bloc/Cubit
**When:** Complex UI logic, business workflows (multi-step forms, nested streams)<br>
**Why:** Predictable, scalable, popular in large teams
### ✅ GetX
**When:** Need quick MVPs with fewer boilerplates<br>
**Why:** Easy syntax, but less preferred in scalable teams

## setState (Built-in State Management)
- **When to Use:**
    - Simple state changes in a single widget
    - UI updates like counter, button toggles, form field validation<br>
- **When NOT to Use:**
    - Sharing data across screens or widgets
    - Managing complex logic (e.g., APIs, auth)

## Lifecycle of StatefulWidget with setState
1. initState()<br>
Called once when widget is inserted
2. didChangeDependencies()<br>
Called after init; listens to InheritedWidgets
3. build()<br>
Called on every setState()
4. setState()<br>
Triggers a rebuild
5. dispose()<br>
Clean up (controllers, listeners, etc.)

## MVVM in Flutter
- MVVM stands for:
    - Model	
        - Business logic and data (API, database, etc.)
    - View	
        - UI (Widgets, screens)
    - ViewModel	
        - Mediator between View & Model — holds the state, processes logic
- MVVM helps separate concerns: UI, data, and logic stay clean and modular.
### Why Use MVVM in Flutter?
- Modular Code	
- Clean Separation
- Ideal for Solo & Team Dev
- State Ready
### Folder Structure for MVVM in Flutter
```dart
/lib
  /models           → Pure data classes (User, Story, etc.)
  /views            → UI Widgets (screens, forms, etc.)
  /viewmodels       → Holds business logic/state per screen
  /services         → API or DB services
  /utils            → Helpers, formatters, constants
  main.dart
```
--- 
## <p align="center">Links in Flutter</p>
--- 
1.  **Required Package:**
    - url_launcher
2. **Add to `pubspec.yaml`**
3. **Open a Link OUTSIDE the App**
    - Opens the link in the device's default browser
    - Use `LaunchMode.externalApplication`
    ```dart
    import 'package:url_launcher/url_launcher.dart';

    void openWebLinkExternally() async {
    final Uri url = Uri.parse('https://flutter.dev');

    if (await canLaunchUrl(url)) {
        await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // ✅ Outside the app
        );
    } else {
        throw 'Could not launch $url';
    }
    }
    ```
4. **Open a Link INSIDE the App** 
    - Opens a link inside your Flutter app using the in-app browser tab (Chrome Custom Tabs / Safari View Controller)  
    - Use `LaunchMode.inAppWebView` or `LaunchMode.platformDefault`
    ```dart
    void openLinkInApp() async {
      final Uri url = Uri.parse('https://flutter.dev');

      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.inAppWebView, // ✅ Inside the app
        );
      } else {
        throw 'Could not launch $url';
      }
    }
    ```
5. **Tapable link in text**
    - `GestureDetector`
    - `InkWell`
    - `Link` widget
        - Before using it: 
            - Add the dependencies: `url_launcher: ^latest`
        and Import: `import 'package:url_launcher/link.dart';`
6. **When to Use Link vs launchUrl**
    - Use `Link`
        - Declarative button or text link in Flutter style
    - Use `launchUrl` directly
        - Full control of browser mode, programmatic logic
--- 
## <p align="center"> `Future<void>` vs `void` </p>
--- 
### `void function`
- This is a synchronous function — it runs from top to bottom, instantly.
```dart
void sayHello() {
    print("Hello!");
}
```
- Use this when:
    - No delay involved
    - No API calls
    - No await required
### `Future<void>`
- This is an asynchronous function — it may take time (e.g., loading a file, waiting for a network call).
```dart
Future<void> loadAudio() async {
  await Future.delayed(Duration(seconds: 2));
  print("Audio Loaded");
}
```
- Use this when:
    - You're using await inside
    - You’re loading assets, reading files, making HTTP requests, etc.

### `Future<void> main() async {}` Asynchronous Main
- This version allows you to await async setup code before launching the app.
- Use when:
    - You need to load data, initialize Firebase, or read from SharedPreferences before runApp()
- **Example:**
    ```dart
    Future<void> main() async {
        WidgetsFlutterBinding.ensureInitialized();  // Required when using async in main
        await Firebase.initializeApp();             // Setup Firebase before UI starts
        runApp(MyApp());
    }
    ```
- Why `WidgetsFlutterBinding.ensureInitialized()?`
    - When you do something before UI starts, like:
        - Using plugins
        - Loading services
        - Reading files
    - You must call this first:
    ```dart
    WidgetsFlutterBinding.ensureInitialized();
    ```
    - This ensures that Flutter’s system services are available before your code runs.
--- 
## <p align="center">Handling user input</p>
--- 
- `SelectableText`<br><br>
    ```dart
    @override
    Widget build(BuildContext context) {
    return const SelectableText('''
    Two households, both alike in dignity,
    In fair Verona, where we lay our scene,
    From ancient grudge break to new mutiny,
    Where civil blood makes civil hands unclean.
    From forth the fatal loins of these two foes''');
    }
    ```
- `RichText`<br><br>
    ```dart
    @override
    Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
        text: 'Hello ',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
            TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' world!'),
        ],
        ),
    );
    }
    ```
- `Slider`
    - The Slider widget lets a user adjust a value by moving an indicator, such as a volume bar.
    - Configuration parameters for the Slider widget:
        - `value` represents the slider's current value
        - `onChanged` is the callback that gets triggered when the handle is moved
        - `min` and `max` establish minimum and maximum values allowed by the slider
        - `divisions` establishes a discrete interval with which the user can move the handle along the track.
    ```dart
        double _currentVolume = 1;
        @override
        Widget build(BuildContext context) {
        return Slider(
            value: _currentVolume,
            max: 5,
            divisions: 5,
            label: _currentVolume.toString(),
            onChanged: (double value) {
            setState(() {
                _currentVolume = value;
            });
            },
        );
        }
    ```
--- 
## <p align="center">Useful Widgets</p>
--- 
### `Scrollbar`
```dart
Scrollbar(
    isAlwaysShow: true, // force the Scrollbar to always show
    showTrackOnHover: true,
    child: ListView.builder(
        itemCount: 20,  //Make sure it's finite otherwise Scrollbar will not visible
        itemBuilder: (c, i) => MyItem(i),
    ),
)
```
### Specialized scrollable widgets `DraggableScrollableSheet`
```dart
DraggableScrollableSheet(
initialChildSize: 0.3, // Starts at 30% of screen height - Start at 30% of screen
minChildSize: 0.2, // Minimum height when dragged down - Minimum 20% height
maxChildSize: 0.8, // Maximum height when dragged up - Can drag up to 80%
builder: (context, scrollController) {
  return SingleChildScrollView(
    controller: scrollController,
    child: Column(
      children: List.generate(
        30,
        (index) => ListTile(title: Text("Item $index")),
      ),
    ),
  );
},
)
```
### `ListWheelScrollView`
```dart 
ListWheelScrollView(
  itemExtent: 90, // height of each item
  children: List.generate(
    20,
    (index) => Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue[100 * ((index % 8) + 1)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Item ${index + 1}',
        style: TextStyle(fontSize: 18),
      ),
    ),
  ),
)
``` 
--- 
## <p align="center">Share state in your app</p>
--- 
### `Callback Function`
- A callback function is a function you pass as a parameter to another function so that it can be called back (executed) later.
- **It’s like telling Flutter:** *Here’s a function. Please call it when you're done with your task.*
- **Real-Life Analogy:**<br>
*You order food from a restaurant (main function).*<br>
***You tell them:** "📞 Call me back when the food is ready."*<br>
*That phone number is the callback.*<br>
- **Dart Code Example:**
    ```dart
    void greetUser(String name, Function onGreet) {
        print("Hello, $name!");
        onGreet(); // 🔁 Callback is used here
    }
    void sayDone() {
        print("Greeting is complete!");
    }

    void main() {
        greetUser("Ali", sayDone);
    }
    /*
    Output:
        Hello, Ali!
        Greeting is complete!
    */
    ``` 
- **Flutter Example:**
    ```dart
    import 'package:flutter/material.dart';
    void main() {
    runApp(MaterialApp(home: MyApp()));
    }

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        body: Center(
            child: MyButton(
            onPressed: () {
                print("Button was clicked!");
            },
            ),
        ),
        );
    }
    }

    class MyButton extends StatelessWidget {
    final VoidCallback onPressed; // <== Callback
    const MyButton({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
        onPressed: onPressed, // Call the passed function
        child: Text('Click Me'),
        );
    }
    }
    ```
- **Types of Callback Functions in Dart:**
    - `VoidCallback`	    A function with no arguments and no return
    - `Function(String)`    Takes a String as parameter
    - `int Function(int)`   Takes and returns an int
    - `Future<void> Function()` Async callback
### What is a `Listener` and `get notified` in Flutter?
- A listener is a function (callback) you attach to an object (like ValueNotifier, AnimationController, etc.) so that you get a notification when something changes.<br>
- **Think of it like saying:**<br>
    - Hey, Flutter — please TELL ME when this value, animation, or state changes, so I can respond.
- **Real-Life Example**
    ```text 
    🧍You = the app
    🔔 Doorbell = the listener
    🚪 Visitor = a change in value
    ``` 
    - When a visitor comes, the doorbell rings (the listener gets called) — this is "getting notified."
- **What does `get notified` mean?**<br>
    In Flutter, it means:
    - The system calls your listener function automatically when something changes, like a value, animation progress, or scroll position.
### `ValueListenableBuilder` and `Listenable` in Flutter
- `Listenable` is a simple interface in Flutter that allows you to register listeners and get notified when a value or state changes.
- It does not rebuild UI by itself, but notifies others (like builders or widgets) to update.
- Think of it like a signal bell: when something changes, everyone who's listening gets notified.
- Common `Listenable` Classes:
    - `ValueNotifier<T>`
        - Notifies when a single value changes
    - `AnimationController`	
        - Notifies animation status or frame changes
    - `ChangeNotifier`
        - Notifies multiple listeners (like Provider uses)
- **Example:**
    ```dart
    final ValueNotifier<int> counter = ValueNotifier<int>(0);
    /*
        value: The current value stored.
        addListener(): Add a callback when value changes.
        removeListener(): Remove a callback.
        notifyListeners(): Manually notify all listeners.
    */
    ```
    - Here, `counter` is a `ValueNotifier`, which is also a `Listenable`.
    - When `counter.value` changes, any listener (like a UI widget) can respond.

- `ValueListenableBuilder:` A widget that rebuilds automatically when a ValueNotifier (or any ValueListenable) value changes.
    - **syntax:**
        ```dart
        ValueListenableBuilder<T>(
        valueListenable: ValueNotifier<T>,
        builder: (context, value, child) {
            return Widget(); // Build UI using new value
        },
        )
        ```
    - When Should You Use It?
        - You want lightweight state management
        - The state only affects one widget or local scope
        - You don’t want to use heavy packages like `Provider` or `Bloc`
--- 
## <p align="center">Gestures in Flutter</p>
--- 
### What is Offset?
- In Flutter, every position on the screen is given in X (horizontal) and Y (vertical) coordinates. This is called an Offset.
- **Example:**
    ```dart
    Offset(50, 100)
    // x = 50 → 50 pixels from the left
    // y = 100 → 100 pixels from the top
    ```
    So Offset = position of your finger on the screen.
### What is Drag?
- A drag gesture happens when the user touches and moves their finger in one direction.
- Flutter provides direction-specific drag gestures:
    - `onVerticalDrag...`
        - Only vertical dragging
    - `onHorizontalDrag...`
        - Only horizontal dragging
- When to Use:
    - Scrolling vertically/horizontally (e.g., inside a custom list)
    - When you want only one-directional movement
    ```dart 
    import 'package:flutter/material.dart';
    import 'dart:math';

    void main() {
    runApp(
        MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Detect()),
        ),
    );
    }

    class Detect extends StatefulWidget {
    @override
    State<Detect> createState() => _DetectState();
    }

    class _DetectState extends State<Detect> {
    double _top = 0;
    final double containerHeight = 300;
    final double boxHeight = 150;

    @override
    Widget build(BuildContext context) {
        return Center(
        child: Container(
            height: containerHeight,
            width: 200,
            color: Colors.grey,
            child: Stack(
            children: [
                Positioned(
                top: _top,
                child: GestureDetector(
                    onVerticalDragStart: (details) {
                    print('Vertical drag started');
                    },

                    onVerticalDragUpdate: (details) {
                    setState(() {
                        _top += details.delta.dy;
                        _top = max(0, min(_top, containerHeight - boxHeight));
                    });
                    },
                    onVerticalDragEnd: (details) {
                    if (_top == 150) {
                        print("Touch End");
                    }
                    },
                    child: Container(
                    height: boxHeight,
                    width: 150,
                    color: Colors.blue,
                    child: const Center(
                        child: Text(
                        "Drag me",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                    ),
                ),
                ),
            ],
            ),
        ),
        );
    }
    }
    ``` 
### What is Pan?
- A pan gesture is similar to drag, but it allows movement in any direction (X and Y axis simultaneously).
- Flutter provides pan gesture callbacks that combine horizontal and vertical behavior.
- Callback
    - `onPanStart`	When pan starts
    - `onPanUpdate`	While panning
    - `onPanEnd`	When pan ends
- When to Use:
    - Free movement (dragging shapes or cards)
    - Drawing apps
    - Custom sliders
    ```dart 
    GestureDetector(
    onPanStart: (details) {
        print('Pan started at ${details.globalPosition}');
    },
    onPanUpdate: (details) {
        print('Pan moved by ${details.delta}');
    },
    onPanEnd: (details) {
        print('Pan ended');
    },
    child: Container(
        height: 150,
        width: 150,
        color: Colors.orange,
        child: Center(child: Text("Pan me")),
    ),
    )
    ``` 
### Gestures in Flutter
- Gestures are user actions like:
    - Tap
    - Double Tap
    - Long Press
    - Drag (Vertical, Horizontal)
    - Pan (drag in any direction)
- Two-Layer Gesture System in Flutter
    1. Pointer Events (Low Level)	
        - Tracks finger/stylus/mouse raw movement on screen
    2. Gestures (High Level)
        - Detects meaningful actions like tap, drag, etc. using pointer data.
### Pointer Events in Flutter
- When you touch the screen with your finger, mouse, or stylus, Flutter detects these interactions using Pointer Events.
- Think of Pointer Events as:
    - Flutter's way of knowing where and how you're touching the screen.
- These events happen before any gesture (like tap or swipe) is recognized.
- **Common Pointer Events:**
    - `PointerDownEvent`
        - When your finger touches the screen.
    - `PointerMoveEvent`
        - When you slide or drag your finger around.
    - `PointerUpEvent`
        - When you lift your finger. 
    - `PointerCancelEvent`
        - When something like a popup or notification cancels the touch.
- **How to Detect Pointer Events?**
    - You use a special widget called `Listener`.
    - `Listener`: Listener is a widget that listens to your raw finger/mouse/stylus actions like touch, drag, release, cancel, etc.
        - You are building a custom drawing, game, or interactive visual
        - Don’t use Listener if:
            - You just want to detect a simple tap or swipe, for that use GestureDetector.
- **When to Use Pointer Events?**
    - Custom drawing (e.g., signature pad, painting app)
    - Advanced gesture detection
    - Multi-touch tracking
    - Raw interaction visualization
--- 
## <p align="center">Navigation & routing</p>
--- 
### Work with tabs `DefaultTabController`
```dart 
import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
``` 


