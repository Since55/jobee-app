import 'package:flutter/material.dart';
import 'package:jobee_app/brick.dart';
import 'package:jobee_app/widgets/button/controller.dart';

import 'button.dart';

class ButtonView extends StatelessWidget with BrickMixin {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        findBrick<Button>(context).controller as ButtonController;

    return ElevatedButton(
      onPressed: controller.onPressed,
      child: Builder(builder: (context) {
        print(2342342342);
        return SuperText();
      }),
    );
  }
}

class SuperText extends StatelessWidget with BrickMixin {
  const SuperText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        findBrick<Button>(context).controller as ButtonController;
    return Text(controller.text).listen(controller, [controller.text]);
  }
}
