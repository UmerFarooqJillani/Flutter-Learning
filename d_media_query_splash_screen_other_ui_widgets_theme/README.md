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

