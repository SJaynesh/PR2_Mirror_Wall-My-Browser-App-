import 'package:flutter/material.dart';
import 'package:mirror_wall_code/Models/PopupMenuItemSelect_Model.dart';

class PopupMenuItemSelect_Provider extends ChangeNotifier {

  PopupMenuItemSelect_Model p1 = PopupMenuItemSelect_Model(PopupMenuItemSelect: "1", PopupMenuItemURI: "") ;

  getValueSelect(val) {
    p1.PopupMenuItemSelect = val;
    notifyListeners();
  }

  getValueURI(val) {
    p1.PopupMenuItemURI = val;
    notifyListeners();
  }
}