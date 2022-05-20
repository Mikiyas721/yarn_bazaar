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
  final Function(int index) onWatchlist;
  final Function(int index) onCompare;
  final Function(int index) onDetail;
  final Function(int index) onShare;
  final Function(int index) onHeaderTap;

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
    return MyExpansionPanelList<YarnViewModel>(
        model: pricesViewModel,
        itemBuilder: (BuildContext context, YarnViewModel priceViewModel, int index) {
          return YarnView._(
            yarnViewModel: priceViewModel,
            onWatchlist: () {
              onWatchlist(index);
            },
            onCompare: () {
              onCompare(index);
            },
            onDetail: () {
              onDetail(index);
            },
            onShare: () {
              onShare(index);
            },
            onHeaderTap: () {
              onHeaderTap(index);
            },
            expanded: index == pricesViewModel.expandedIndex,
          );
        },
        errorView: Center(
            child: EmptyErrorView.defaultError(
          onRetry: onReload,
          description: pricesViewModel.error,
        )),
        loadingView: const Center(child: MyLoadingView()),
        emptyView: Center(
          child: EmptyErrorView.defaultEmpty(
            onReload: onReload,
            description: "No yarns found for this section",
          ),
        ));
  }
}

class YarnView extends ExpansionPanel {
  final YarnViewModel yarnViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onCompare;
  final VoidCallback onShare;
  final VoidCallback onDetail;
  final VoidCallback onHeaderTap;
  final bool expanded;

  YarnView._({
    required this.yarnViewModel,
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
                onTap: onHeaderTap,
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
                                  yarnViewModel.count,
                                  style: context.bodyMedium?.copyWith(
                                    color: yarnViewModel.colour.getYarnColorForeground(),
                                  ),
                                ),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: yarnViewModel.colour.getYarnColorBackground(),
                                    border: Border.all(
                                      width: 0.1,
                                      color: context.primaryColor,
                                    )),
                              ),
                              8.hSpace,
                              Text(
                                yarnViewModel.yarnType,
                                style: context.titleSmall,
                              )
                            ],
                          ),
                          Text(
                            '\$${yarnViewModel.quantityInKgs}/Kg',
                            style: TextStyle(
                              color: context.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(yarnViewModel.companyName, style: context.bodyLarge),
                            Text(yarnViewModel.companyType, style: context.labelSmall)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconPrefixedText(
                            icon: Icons.location_on_outlined,
                            label: yarnViewModel.deliveryArea,
                            iconColor: Colors.grey,
                          ),
                          IconPrefixedText(
                            icon: Icons.access_time_outlined,
                            label: 'Updated ${yarnViewModel.lastUpdated}',
                            iconColor: Colors.grey,
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
                    yarnViewModel.purpose,
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
                          Text(yarnViewModel.sellerType,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: yarnViewModel.sellerType == "Mill"
                                      ? Colors.blue
                                      : Colors.green))
                        ]),
                        IconPrefixedText(
                          icon: Icons.timelapse_outlined,
                          label: yarnViewModel.deliveryPeriod,
                          iconColor: Colors.grey,
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
