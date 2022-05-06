import "package:flutter/material.dart";

import '../../common/view_model.dart';

class EmptyErrorLoadingView<T extends Object> extends StatelessWidget {
  final EmptyErrorLoadingViewModel<T> model;
  final Widget Function(BuildContext, T) builder;
  final Widget errorView;
  final Widget loadingView;
  final Widget emptyView;

  const EmptyErrorLoadingView({
    Key? key,
    required this.model,
    required this.builder,
    required this.errorView,
    required this.loadingView,
    required this.emptyView,
  }) : super(key: key);

  Widget _buildBody(BuildContext context) {
    if (model.isLoading) return loadingView;
    if (model.error != null) return errorView;
    if (model.isEmpty) return emptyView;
    return builder(context, model.data!);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildBody(context),
    );
  }
}

class SimpleListView<T> extends StatelessWidget {
  final SimpleListViewModel<T> model;
  final Widget Function(BuildContext, T) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final Widget errorView;
  final Widget loadingView;
  final Widget emptyView;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const SimpleListView({
    Key? key,
    required this.model,
    required this.itemBuilder,
    required this.errorView,
    required this.loadingView,
    required this.emptyView,
    this.padding,
    this.separatorBuilder,
    this.shrinkWrap = false,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyErrorLoadingView<List<T>>(
      model: model,
      emptyView: emptyView,
      errorView: errorView,
      loadingView: loadingView,
      builder: (context, data) {
        return ListView.separated(
          padding: padding,
          shrinkWrap: shrinkWrap,
          itemBuilder: (context, index) {
            return itemBuilder(context, data[index]);
          },
          physics: physics,
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) {
            return separatorBuilder?.call(context, index) ?? Container();
          },
        );
      },
    );
  }
}

class MyExpansionPanelList<T> extends StatelessWidget {
  final SimpleListViewModel<T> model;
  final ExpansionPanel Function(BuildContext, T, int index) itemBuilder;
  final Widget errorView;
  final Widget loadingView;
  final Widget emptyView;
  final Duration animationDuration;
  final EdgeInsets expandedHeaderPadding;
  final double elevation;
  final Color? dividerColor;
  final Function(int, bool)? expansionCallback;

  const MyExpansionPanelList(
      {Key? key,
      required this.model,
      required this.itemBuilder,
      required this.errorView,
      required this.loadingView,
      required this.emptyView,
      this.animationDuration = const Duration(milliseconds: 200),
      this.expandedHeaderPadding = const EdgeInsets.symmetric(
        vertical: 64.0 - 48.0,
      ),
      this.elevation = 2,
      this.dividerColor,
      this.expansionCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyErrorLoadingView<List<T>>(
      model: model,
      emptyView: emptyView,
      errorView: errorView,
      loadingView: loadingView,
      builder: (context, data) {
        var children = <ExpansionPanel>[];
        for (int i=0;i<model.data!.length;i++) {
          children.add(itemBuilder(context, model.data![i], i));
        }
        return ExpansionPanelList(
          key: key,
          children: children,
          animationDuration: animationDuration,
          expandedHeaderPadding: expandedHeaderPadding,
          elevation: elevation,
          dividerColor: dividerColor,
          expansionCallback: expansionCallback,
        );
      },
    );
  }
}
