import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/view_model.dart';

import 'controller.dart';

class Provider<T> extends InheritedWidget {
  final T value;

  Provider({
    Key? key,
    required this.value,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static T of<T>(BuildContext context) {
    Provider<T> widget = context.dependOnInheritedWidgetOfExactType<Provider<T>>()!;
    return widget.value;
  }
}

class ControllerProvider<T extends Controller> extends StatefulWidget {
  final T Function() create;
  final void Function(T)? onInit;
  final void Function(T)? onDispose;
  final Widget Function(BuildContext, T) builder;

  const ControllerProvider({
    Key? key,
    required this.create,
    required this.builder,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  _ControllerProviderState<T> createState() => _ControllerProviderState<T>();
}

class _ControllerProviderState<T extends Controller> extends State<ControllerProvider<T>> {
  late T controller;

  @override
  void initState() {
    controller = widget.create();
    widget.onInit?.call(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      value: controller,
      child: Builder(builder: (context) {
        return widget.builder(context, controller);
      }),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    widget.onDispose?.call(controller);
    super.dispose();
  }
}

class MultiControllersProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ViewModelBuilder<VM extends ViewModel> extends StatelessWidget {
  final BlocViewModelController<dynamic, dynamic, dynamic, VM> controller;
  final Widget Function(BuildContext, VM?) builder;

  const ViewModelBuilder({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  static Widget withController<VM extends ViewModel,
      P extends BlocViewModelController<dynamic, dynamic, dynamic, VM>>({
    required P Function() create,
    required Widget Function(BuildContext, P, VM?) builder,
    void Function(P)? onInit,
  }) {
    return ControllerProvider<P>(
      create: create,
      onInit: onInit,
      builder: (context, controller) {
        return ViewModelBuilder<VM>(
          controller: controller,
          builder: (c, v) => builder(c, controller, v),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VM>(
      initialData: controller.currentViewModel,
      stream: controller.viewModelStream,
      builder: (context, snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
