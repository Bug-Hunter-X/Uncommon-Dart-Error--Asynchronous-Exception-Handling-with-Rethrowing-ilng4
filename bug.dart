```dart
import 'dart:async';

Future<void> fetchData() async {
  try {
    // Simulate an asynchronous operation that might throw an exception
    await Future.delayed(Duration(seconds: 2));
    var data = await Future.error('Network error'); // Simulate a network error
    print('Data: $data');
  } on TimeoutException catch (e) {
    print('Timeout error: $e');
  } on FormatException catch (e) {
    print('Format error: $e');
  } on SocketException catch (e) {
    print('Socket error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Rethrow the error to be handled higher up the call stack
  }
}

void main() async {
  await fetchData();
}
```