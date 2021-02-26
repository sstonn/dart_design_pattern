import 'asyncronousFunction.dart';

void main(List<String> arguments) async {
  var _asyncronousServer = AsyncronousServer();
  var _serverFacade = ServerFacade(asyncronousServer: _asyncronousServer);
  await _serverFacade.startServer();
  await _serverFacade.endServer();
}

class ServerFacade {
  final AsyncronousServer _asyncronousServer;

  ServerFacade({AsyncronousServer asyncronousServer})
      : _asyncronousServer = asyncronousServer;

  Future<void> startServer() {
    return Future.wait([
      _asyncronousServer.init().whenComplete(() {
        print('Start step 1');
      }),
      _asyncronousServer.runMailServer().whenComplete(() {
        print('Start step 2');
      }),
      _asyncronousServer.runSomethingElse().whenComplete(() {
        print('Start step 3');
      })
    ]).whenComplete(() {
      print('Server has started');
    });
  }

  Future<void> endServer() {
    return Future.wait([
      _asyncronousServer
          .stopMailServer()
          .whenComplete(() => print('Stop step 1')),
      _asyncronousServer
          .stopSomethingElse()
          .whenComplete(() => print('Stop step 2'))
    ]).whenComplete(() {
      print('Server has stopped');
    });
  }
}
