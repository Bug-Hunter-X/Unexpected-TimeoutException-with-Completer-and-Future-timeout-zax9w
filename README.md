# Dart Completer and Future.timeout Unexpected Behavior

This repository demonstrates a potential issue when using Dart's `Completer` and `Future.timeout` together.  If the future completed by the `Completer` takes longer than the timeout, a `TimeoutException` might still be thrown even if the future eventually completes successfully.  This occurs because the timeout is checked before the future's completion.

The `bug.dart` file showcases the issue, while `bugSolution.dart` provides a solution to handle it gracefully.

## Problem

The code in `bug.dart` uses a `Timer` to simulate an asynchronous operation. This operation is designed to complete after 2 seconds. However, `Future.timeout` is set to 1 second.  Even though the operation eventually succeeds, the `TimeoutException` is still caught.

## Solution

The `bugSolution.dart` file demonstrates a solution. It uses a `try-catch` block to handle potential exceptions.  Furthermore, error handling is implemented to account for a variety of scenarios including the `TimeoutException` and other potential errors during the `Completer`'s execution.
