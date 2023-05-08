import 'package:flutter/material.dart';
import 'package:mirror_wall_code/Models/LinerValue_Model.dart';

class LinerValue_Provider extends ChangeNotifier{

  LinerValue_Model l1 = LinerValue_Model(WebProgress: 0);

  ChangeProgress(Pg) {
    l1.WebProgress = Pg/100;
    notifyListeners();
  }
}