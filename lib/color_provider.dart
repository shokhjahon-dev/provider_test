import 'package:flutter/cupertino.dart';

class ColorProvider extends ChangeNotifier {

  bool _isRed = false;


  change(){
    _isRed = !_isRed;
    notifyListeners();
  }

  bool get isRed => _isRed;

}