import 'package:flutter/material.dart';
import 'package:jobee_app/brick.dart';
import 'package:jobee_app/widgets/button/view.dart';

import 'controller.dart';

class Button extends Brick {
  Button({super.key});

  Controller? _controller;

  @override
  Controller get controller {
    if (_controller == null) _controller = ButtonController();
    return _controller!;
  }

  @override
  Widget builder(BuildContext context) => ButtonView();
}
