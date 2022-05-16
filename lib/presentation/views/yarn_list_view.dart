import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/empty_error_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/simple_list_view.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class YarnListView extends StatelessWidget {
  final YarnsViewModel pricesViewModel;
  final VoidCallback onReload;
  final Function (YarnViewModel priceViewModel) onWatchlist;
  final Function (YarnViewModel priceViewModel) onCompare;
  final Function (YarnViewModel priceViewModel) onDetail;
  final Function (YarnViewModel priceViewModel) onShare;
  final Function (int index, bool wasExpanded) onHeaderTap;

  const YarnListView({
    Key? key,
    required this.pricesViewModel,
    required this.onReload,
    required this.onWatchlist,
    required this.onCompare,
    required this.onDetail,
    required this.onShare,
    required this.onHeaderTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MyExpansionPanelList<YarnViewModel>(
          model: pricesViewModel,
          itemBuilder:
              (BuildContext context, YarnViewModel priceViewModel, int index) {
            return YarnView._(
              priceViewModel: priceViewModel,
              onWatchlist: () {
                onWatchlist(priceViewModel);
              },
              onCompare: () {
                onCompare(priceViewModel);
              },
              onDetail: () {
                onDetail(priceViewModel);
              },
              onShare: () {
                onShare(priceViewModel);
              },
              onHeaderTap: (bool wasExpanded) {
                onHeaderTap(index, wasExpanded);
              },
              expanded: index == pricesViewModel.expandedIndex,
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
          )),
    );
  }
}

class YarnView extends ExpansionPanel {
  final YarnViewModel priceViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onCompare;
  final VoidCallback onShare;
  final VoidCallback onDetail;
  final Function(bool wasExpanded) onHeaderTap;
  final bool expanded;

  YarnView._({
    required this.priceViewModel,
    required this.onWatchlist,
    required this.onCompare,
    required this.onShare,
    required this.onDetail,
    required this.onHeaderTap,
    required this.expanded,
  }) : super(
      canTapOnHeader: true,
      hasIcon: false,
      isExpanded: expanded,
      headerBuilder: (BuildContext context, bool isShowing) {
        return InkWell(
          onTap: (){
            onHeaderTap(expanded);
          },
          child: Padding(
            padding: expanded
                ? const EdgeInsets.symmetric(horizontal: 15)
                : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            priceViewModel.count,
                            style: const TextStyle(color: Colors.white),
                          ),
                          color: priceViewModel.sellerType == "Mill"
                              ? Colors.blue
                              : Colors.green,
                          padding: const EdgeInsets.all(8),
                        ),
                        8.hSpace,
                        Text(
                          priceViewModel.yarnType,
                          style:
                          const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      '\$${priceViewModel.quantityInKgs}/Kg',
                      style: TextStyle(
                          color: context.primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(priceViewModel.companyName),
                      Text(
                        priceViewModel.companyType,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconPrefixedText(
                      icon: Icons.location_on_outlined,
                      label: priceViewModel.deliveryArea,
                      color: Colors.grey,
                    ),
                    IconPrefixedText(
                      icon: Icons.access_time_outlined,
                      label: 'Updated ${priceViewModel.lastUpdated}',
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 1,
            ),
            10.vSpace,
            Text(
              priceViewModel.purpose,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Text(
                      'Seller type: ',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(priceViewModel.sellerType,
                        style: TextStyle(
                            fontSize: 12,
                            color: priceViewModel.sellerType == "Mill"
                                ? Colors.blue
                                : Colors.green))
                  ]),
                  IconPrefixedText(
                    icon: Icons.timelapse_outlined,
                    label: priceViewModel.deliveryPeriod,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: onWatchlist,
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    'Watchlist',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton.icon(
                    onPressed: onCompare,
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Compare',
                      style: TextStyle(color: Colors.grey),
                    )),
                TextButton.icon(
                    onPressed: onShare,
                    icon: const Icon(
                      Icons.share,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Share',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            Center(
              child: OutlinedButton(
                onPressed: onDetail,
                child: const Text('Detail'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(150, 36),
                  side: const BorderSide(
                    width: 0.7,
                    color: Color(0xFFFF9F10),
                  ),
                ),
              ),
            ),
            10.vSpace
          ],
        ),
      ));
}
