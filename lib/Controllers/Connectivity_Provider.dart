import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../Models/Connectivity_Model.dart';

class Connectivity_Provider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  Connectivity_Model c1 = Connectivity_Model(status: "Waiting");

  ChackInternetConnectivity() {
    c1.connectivityStream = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      switch (connectivityResult) {
        case ConnectivityResult.wifi:
          c1.status = "WIFI";
          notifyListeners();
          break;

        case ConnectivityResult.mobile:
          c1.status = "MOBILE DATA";
          notifyListeners();
          break;

        default:
          c1.status = "Waiting";
          notifyListeners();
          break;
      }
    });
  }
}
