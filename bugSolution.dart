```dart
import 'dart:async';

Future<void> main() async {
  final completer = Completer<int>();

  Timer(const Duration(seconds: 2), () {
    completer.complete(10);
  });

  try {
    final result = await completer.future.timeout(const Duration(seconds: 1), onTimeout: () {
        return -1; // Return a default value if timeout occurs
      });
    print('Result: $result');
  } on TimeoutException catch (e) {
    print('Timeout occurred: ${e}');
  } catch (e) {
    print('An error occurred: $e');
  }
}
```