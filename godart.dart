import 'dart:ffi';
import 'dart:isolate';

typedef StartWorkType = Void Function(Int64 port);
typedef StartWorkFunc = void Function(int port);

void main() async {
  final lib = DynamicLibrary.open("./godart.so");

  final initializeApi = lib.lookupFunction<IntPtr Function(Pointer<Void>),
      int Function(Pointer<Void>)>("InitializeDartApi");
  if (initializeApi(NativeApi.initializeApiDLData) != 0) {
    throw "Failed to initialize Dart API";
  }

  final interactiveCppRequests = ReceivePort()
    ..listen((data) {
      print('Received: ${data} from Go');
    });
  final int nativePort = interactiveCppRequests.sendPort.nativePort;

  final StartWorkFunc startWork =
      lib.lookup<NativeFunction<StartWorkType>>("StartWork").asFunction();
  startWork(nativePort);
  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    print("Dart: 2 seconds passed");
  }
}
