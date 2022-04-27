import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/widgets/empty_error_view.dart';
import 'package:yarn_bazaar/common/widgets/my_loading_view.dart';
import 'package:yarn_bazaar/common/widgets/simple_list_view.dart';
import 'package:yarn_bazaar/presentation/models/prices_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';

class PriceListViewAppBar extends StatelessWidget {
  final VoidCallback onNotification;

  const PriceListViewAppBar({
    Key? key,
    required this.onNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: SearchField(onDiscardText: () {}),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: onNotification,
          )
        ],
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
            Text('All'),
            Text('Cotton'),
            Text('Texturise'),
            Text('PSF'),
            Text('PC'),
            Text('PV'),
            Text('Viscose'),
            Text('CP'),
            Text('Linen'),
            Text('Modal'),
            Text('Rayon'),
            Text('Fancy'),
            Text('Worsted Wool'),
          ],
        ));
  }
}

class PriceListViewBody extends StatelessWidget {
  final PricesViewModel pricesViewModel;
  final VoidCallback onReload;

  const PriceListViewBody({
    Key? key,
    required this.pricesViewModel,
    required this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleListView<PriceViewModel>(
      model: pricesViewModel,
      itemBuilder: (BuildContext context, PriceViewModel priceViewModel) {
        return PriceView._(
          priceViewModel: priceViewModel,
        );
      },
      errorView: Center(
          child: EmptyErrorView.defaultError(
        onRetry: onReload,
      )),
      loadingView: const Center(child: MyLoadingView()),
      emptyView: Center(
        child: EmptyErrorView.defaultEmpty(
          onReload: onReload,
        ),
      ),
    );
  }
}

class PriceView extends StatelessWidget {
  final PriceViewModel priceViewModel;

  const PriceView._({
    Key? key,
    required this.priceViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
