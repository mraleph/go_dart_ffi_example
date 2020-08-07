Demo of calling Dart asynchronously from Go goroutine.

```console
$ go build -o godart.so -buildmode=c-shared
$ dart godart.dart
Go: Starting some asynchronous work
Go: Returning to Dart
GO: 2 seconds passed
Received: 1 from Go
Dart: 2 seconds passed
GO: 2 seconds passed
Received: 2 from Go
Dart: 2 seconds passed
GO: 2 seconds passed
Received: 3 from Go
Dart: 2 seconds passed
GO: 2 seconds passed
Received: 4 from Go
Dart: 2 seconds passed
GO: 2 seconds passed
Received: 5 from Go
Dart: 2 seconds passed
```