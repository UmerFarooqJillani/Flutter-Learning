# <p align="center"> d_media_query_splash_screen_other_ui_widgets_theme </p>

## null-safety
### `!` (Null assertion operator)
- Ensures that currentState is not null. 
- It's say the Dart Trust me — it’s not null.
- Without it, Dart will complain if you access. validate() on something that could be null. 
- `!`: force non-null (⚠️ will crash if value is null).
### `??` (null-coalescing operator)
- It returns the value on the left if it's not null, otherwise it returns the value on the right.
- **?? '' means:** if value is null, use empty string.
```dart
List<Map<String, String>> songsList = [
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
    {
      'name': 'a',
      'path': '../assets/images/a.png',
      'description': 'click to more details',
    },
  ];

itemBuilder: (context, index) {
    final song = songsList[index]; // Extract Map at index
    return ListTile(
        title: Text(song['name']), // Null-safe access
        subtitle: Text(song['description'] ?? ''),
        leading: Image.asset(song['path'] ?? '../assets/images/a.png'),
    );
},
```
- OR, In simple example:
```dart
    String? name;
    print(name ?? 'Guest'); // Output: Guest
//If name is null, it returns 'Guest'
```
--- 
## <p align="center"> How to structure the `/lib` folder in a real-world Flutter project </p>
--- 
0. `/lib Folde`
```dart
lib/
│
├── main.dart                           # Entry point of the app (runApp)
│
├── app/                                # App-wide configuration (1-time setup)
│   ├── routes.dart                     # All route names and routing logic
│   ├── themes/                         # Theme settings (colors, text styles)
│   │   ├── light_theme.dart
│   │   └── dark_theme.dart
│   └── constants/                      # Static constants (not changing at runtime)
│       ├── colors.dart
│       ├── strings.dart
│       ├── sizes.dart
│       └── assets.dart                 # Image/font asset paths
│
├── core/                               # Core infrastructure and global tools
│   ├── network/                        # API service base (Dio/HTTP)
│   │   ├── api_client.dart
│   │   └── endpoints.dart
│   ├── extensions/                     # Dart extensions (e.g. String.capitalize)
│   │   └── string_extensions.dart
│   └── utils/                          # Global helpers (validators, formatters)
│       ├── validators.dart
│       ├── date_format.dart
│       └── logger.dart
│
├── models/                             # Plain Dart classes (data layer)
│   ├── alphabet_model.dart
│   ├── number_model.dart
│   └── user_model.dart
│
├── data/                               # Local or sample/mock content
│   ├── alphabet_data.dart              # Alphabet list
│   ├── story_data.dart                 # List of stories
│   └── number_data.dart                # List of numbers
│
├── features/                           # Main logic per feature/screen/module
│   ├── home/
│   │   ├── home_screen.dart
│   │   ├── home_controller.dart
│   │   └── home_widgets.dart
│   ├── login/
│   │   ├── login_screen.dart
│   │   ├── login_form.dart
│   │   └── login_controller.dart
│   ├── dashboard/
│   │   ├── dashboard_screen.dart
│   │   └── dashboard_controller.dart
│   └── alphabets/
│       ├── alphabets_screen.dart
│       ├── alphabet_card.dart
│       ├── alphabet_controller.dart
│       └── alphabet_detail_screen.dart
│
├── services/                           # Third-party integrations
│   ├── firebase_service.dart
│   ├── auth_service.dart
│   └── local_db_service.dart
│
├── widgets/                            # Reusable global widgets
│   ├── custom_button.dart
│   ├── app_logo.dart
│   ├── image_tile.dart
│   └── custom_textfield.dart
│
└── config/ (Optional)
    ├── env.dart                        # Environment variables (dev/prod/baseURL)
    └── app_config.dart
```
1. `main.dart`
  - It starts your app
  - Connects theme, routing, localization, etc.
```dart
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids App',
      initialRoute: '/',
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
  }
}
```
2. `app/constants/` 
Store non-changing values like:
  - Colors
  - Strings
  - Sizes
  - Padding
  - Duration
  - Icons<br>
**Example:** `app/constants/colors.dart`
```dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Colors.orange;
  static const Color secondary = Colors.blueAccent;
  static const Color background = Colors.white;
}
```
**Example:** `app/constants/strings.dart`
```dart
class AppStrings {
  static const String appName = "My Kids App";
  static const String welcome = "Welcome to the story world!";
}
```
3. `data/dummy_data/`
  - For Static Lists or Sample Content
  - If you want to store fake story lists, image lists, categories, etc., put them here.
**Example:** `data/dummy_data/story_list.dart`
```dart
List<Map<String, String>> storyList = [
  {
    'title': 'The Brave Rabbit',
    'image': 'assets/images/rabbit.png',
  },
  {
    'title': 'Flying Cat',
    'image': 'assets/images/cat.png',
  },
];
```
- This helps you separate data from UI logic.
4. `data/models/`
  - For Structured Data Models.
  - If you have dynamic data (like from JSON), create classes for it here.
**Example:** `user_model.dart`
```dart
class UserModel {
  final String name;
  final int age;

  UserModel({required this.name, required this.age});
}
```
**Example:** `alphabet_model.dart`
  - Use a Class (Model) to Represent Each Alphabet Item
  - Use a Map for quick tasks or prototypes, but use a class (model) in real projects for better structure, maintainability, and error checking.
```dart
class AlphabetModel {
  final String letter;
  final String imagePath;
  final String description;

  AlphabetModel({
    required this.letter,
    required this.imagePath,
    required this.description,
  });
}
``` 
`data/dummy_data/alphabet_data.dart`<br>  
  - Create a Dummy List of Alphabets (Using the Model)
```dart
import '../models/alphabet_model.dart';

final List<AlphabetModel> alphabetList = [
  AlphabetModel(
    letter: 'A',
    imagePath: 'assets/images/a.png',
    description: 'A for Apple',
  ),
  AlphabetModel(
    letter: 'B',
    imagePath: 'assets/images/b.png',
    description: 'B for Ball',
  ),
  AlphabetModel(
    letter: 'C',
    imagePath: 'assets/images/c.png',
    description: 'C for Cat',
  ),
  // ... continue for the full alphabet
];
```
