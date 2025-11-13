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