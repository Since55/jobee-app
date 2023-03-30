import 'package:flutter/widgets.dart';

abstract class Brick extends StatefulWidget {
  const Brick({super.key});

  Controller get controller;

  Widget builder(BuildContext context);

  @override
  // ignore: no_logic_in_create_state
  State<Brick> createState() => _BrickState();
}

class _BrickState extends State<Brick> {
  @override
  @protected
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

class Controller extends ChangeNotifier {}

mixin BrickMixin implements Widget {
  B findBrick<B extends Brick>(BuildContext context) {
    return context.findAncestorWidgetOfExactType<B>()!;
  }

  // C findController<C extends Controller>(BuildContext context) {
  //   return findBrick(context).controller as C;
  // }
}

extension ListenExt on Widget {
  Widget listen(ChangeNotifier notifier, List<dynamic> deps) {
    return _Listener(deps: deps, notifier: notifier, child: this);
  }
}

class _Listener extends StatefulWidget {
  final ChangeNotifier notifier;
  final List<dynamic> deps;
  final Widget child;

  const _Listener({
    Key? key,
    required this.deps,
    required this.child,
    required this.notifier,
  }) : super(key: key);

  @override
  State<_Listener> createState() => _ListenerState();
}

class _ListenerState extends State<_Listener> {
  List<dynamic>? _previousDeps;

  @override
  void initState() {
    widget.notifier.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    widget.notifier.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    if (_previousDeps == null) _update();

    for (int i = 0; i < widget.deps.length; i++) {
      final current = widget.deps[i];
      final previous = _previousDeps![i];

      if (current != previous) {
        _update();
        break;
      }
    }
  }

  void _update() {
    setState(() => _previousDeps = widget.deps);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
