import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/empty_error_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/simple_list_view.dart';
import 'package:yarn_bazaar/presentation/models/prices_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';

class PriceListView extends StatelessWidget {
  final PricesViewModel pricesViewModel;
  final VoidCallback onReload;

  const PriceListView({
    Key? key,
    required this.pricesViewModel,
    required this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyExpansionPanelList<PriceViewModel>(
        model: pricesViewModel,
        itemBuilder: (BuildContext context, PriceViewModel priceViewModel) {
          return PriceView._(
            priceViewModel: priceViewModel,
            onWatchlist: () {},
            onCompare: () {},
            onDetail: () {},
            onShare: () {},
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
        ));
  }
}

class PriceView extends ExpansionPanel {
  final PriceViewModel priceViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onCompare;
  final VoidCallback onShare;
  final VoidCallback onDetail;

  PriceView._({
    required this.priceViewModel,
    required this.onWatchlist,
    required this.onCompare,
    required this.onShare,
    required this.onDetail,
  }) : super(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isShowing) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child:
                                Text(priceViewModel.yarnQuality.split(' ')[0]),
                            color: priceViewModel.sellerType == "Mill"
                                ? Colors.blue
                                : Colors.green,
                            padding: const EdgeInsets.all(8),
                          ),
                          Text(priceViewModel.yarnQuality.split(' ')[1])
                        ],
                      ),
                      Text('\$${priceViewModel.quantityInKgs}/Kg')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(priceViewModel.companyName),
                      Text(priceViewModel.companyType)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconPrefixedText(
                        icon: Icons.location_on_outlined,
                        label: priceViewModel.companyName,
                      ),
                      IconPrefixedText(
                        icon: Icons.access_time,
                        label: priceViewModel.lastUpdated,
                      ),
                    ],
                  ),
                  const Divider()
                ],
              );
            },
            body: Column(
              children: [
                Text(priceViewModel.qualityDetails),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(text: 'Seller type'),
                      TextSpan(
                          text: priceViewModel.sellerType,
                          style: TextStyle(
                              color: priceViewModel.sellerType == "Mill"
                                  ? Colors.blue
                                  : Colors.green))
                    ])),
                    IconPrefixedText(
                      icon: Icons.timelapse_outlined,
                      label: priceViewModel.deliveryPeriod,
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: onWatchlist,
                        icon: const Icon(Icons.favorite_border),
                        label: const Text('Watchlist')),
                    TextButton.icon(
                        onPressed: onCompare,
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text('Compare')),
                    TextButton.icon(
                        onPressed: onShare,
                        icon: const Icon(Icons.share),
                        label: const Text('Share')),
                  ],
                ),
                Center(
                  child: OutlinedButton(
                      onPressed: onDetail, child: const Text('Detail')),
                )
              ],
            ));
}
