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
