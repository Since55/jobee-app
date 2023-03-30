import 'dart:ui';

import 'package:jobee_app/brick.dart';

class ButtonController extends Controller {
  String text = '1';

  void onPressed() {
    text = (int.parse(text) + 1).toString();
    notifyListeners();
  }
}