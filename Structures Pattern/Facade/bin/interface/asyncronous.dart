abstract class StartServer {
  Future<void> init();
  Future<void> runMailServer();
  Future<void> runSomethingElse();
}

abstract class EndServer {
  Future<void> stopMailServer();
  Future<void> stopSomethingElse();
}
