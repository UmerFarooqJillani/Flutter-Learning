## What is a Future?
- A Future in Dart represents a single asynchronous operation that will complete once, either with data (success) or with an error (failure).
- Think of it as a one-time event (like an HTTP request).
```dart
Future<String> getData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data Loaded!";
}
```
## What is a Stream?
- A Stream represents a continuous flow of asynchronous data, it can emit multiple values over time (like a live data feed, chat messages, or sensor readings).
```dart
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // send data one by one
  }
}
```

## What is a FutureBuilder?
- The FutureBuilder widget is used when you want to display data once a Future completes.
- Works for one-time async tasks like API calls, reading from a file, etc.
- Once data is fetched, it won’t update automatically unless you rebuild it manually (e.g., by calling setState()).
```dart
FutureBuilder<String>(
  future: getData(), // Function returning a Future
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // loading
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return Text('Result: ${snapshot.data}');
    }
  },
);
```
## What is a StreamBuilder?
- The StreamBuilder widget is used for real-time or continuous data updates.
- Used for continuous or live data.
- Automatically rebuilds the UI every time new data arrives in the stream.
- Commonly used with Firebase Realtime Database, WebSockets, or sensors.
```dart
StreamBuilder<int>(
  stream: countStream(), // Function returning a Stream
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }
    return Text('Count: ${snapshot.data}');
  },
);
```