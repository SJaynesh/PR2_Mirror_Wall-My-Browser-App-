import 'dart:async';

class Connectivity_Model {
  String status;
  StreamSubscription? connectivityStream;

  Connectivity_Model({required this.status, this.connectivityStream});
}
