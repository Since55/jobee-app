import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBox {
  List<BlocBase> _blocs = [];

  T add<T extends BlocBase>(T bloc) {
    if (_blocs.whereType<T>().isNotEmpty) delete<T>();
    _blocs.add(bloc);
    return bloc;
  }

  void delete<T extends BlocBase>() {
    _blocs.removeWhere((e) => e is T);
  }

  T find<T extends BlocBase>() {
    _blocs = _blocs.where((e) => !e.isClosed).toList();
    return _blocs.firstWhere((e) => e is T && !e.isClosed) as T;
  }
}

mixin BlocStateProviderMixin implements Closable {
  final List<StreamSubscription> _listeners = [];

  void listenBlocStateOf<B extends BlocBase<S>, S>(
    BuildContext context,
    void Function(S state) listener,
  ) {
    final bloc = context.read<B>();
    bloc.stream.listen(listener);
    listener(bloc.state);
  }

  void listenBlocState<B extends BlocBase<S>, S>(
    B bloc,
    void Function(S state) listener,
  ) {
    bloc.stream.listen(listener);
    listener(bloc.state);
  }

  @override
  Future<void> close() async {
    _listeners.map((e) => e.cancel());
  }
}

mixin MemoBlocMixin<S> on BlocBase<S> {
  static Map<String, dynamic> _stateStore = {};

  String get _name => runtimeType.toString();

  S? get _memoState => _stateStore[_name] as S?;

  set _memoState(S? nextState) => _stateStore[_name] = nextState;

  @override
  get state {
    _memoState ??= super.state;
    return _memoState!;
  }

  @override
  void onChange(Change<S> change) {
    super.onChange(change);
    _memoState = change.nextState;
  }

  static void clearAll() {
    _stateStore = {};
  }

  static void clearOnly(String name) {
    _stateStore.remove(name);
  }
}
