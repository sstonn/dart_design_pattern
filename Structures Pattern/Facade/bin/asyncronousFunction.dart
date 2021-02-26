import 'interface/asyncronous.dart';

const ONE_SECOND = 1;

class AsyncronousServer implements StartServer, EndServer {
  @override
  Future<void> init() {
    return Future.delayed(Duration(seconds: ONE_SECOND));
  }

  @override
  Future<void> runMailServer() {
    return Future.delayed(Duration(seconds: ONE_SECOND));
  }

  @override
  Future<void> runSomethingElse() {
    return Future.delayed(Duration(seconds: ONE_SECOND));
  }

  @override
  Future<void> stopMailServer() {
    return Future.delayed(Duration(seconds: ONE_SECOND));
  }

  @override
  Future<void> stopSomethingElse() {
    return Future.delayed(Duration(seconds: ONE_SECOND));
  }
}
