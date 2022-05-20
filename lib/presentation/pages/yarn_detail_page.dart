import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/presentation/controllers/fetch_similar_yarns_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/yarn_detail_controller.dart';
import 'package:yarn_bazaar/presentation/models/seller_view_model.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/presentation/views/seller_view.dart';
import 'package:yarn_bazaar/presentation/views/yarn_list_view.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class YarnDetailPage extends StatelessWidget with DateTimeMixin {
  static const route = '/yarnDetailPage';

  const YarnDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yarn = ModalRoute.of(context)?.settings.arguments as Yarn?;
    final size = MediaQuery.of(context).size;
    return yarn == null
        ? Scaffold(
            body: Center(child: Text("Unable to find selected Yarn")),
          )
        : ControllerProvider<YarnDetailController>(
            create: () => YarnDetailController(context),
            builder: (context, controller) {
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: size.height * 0.19,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const PopButton(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.favorite_border),
                                      color: Colors.grey,
                                      onPressed: controller.onFavourite,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline),
                                      color: Colors.grey,
                                      onPressed: controller.onAdd,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.share),
                                      color: Colors.grey,
                                      onPressed: controller.onShareDetail,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                            yarn.count,
                                            style: context.bodyLarge?.copyWith(
                                              color: yarn.colour.getYarnColorForeground(),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: yarn.colour.getYarnColorBackground(),
                                              border: Border.all(
                                                width: 0.1,
                                                color: context.primaryColor,
                                              )),
                                          padding: const EdgeInsets.all(8),
                                        ),
                                        8.hSpace,
                                        Text(
                                          yarn.yarnType,
                                          style: context.titleMedium,
                                        )
                                      ],
                                    ),
                                    Text(
                                      '\$${yarn.quantityInKgs.value}/Kg',
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
                                      Text(yarn.user!.businessDetail!.companyName!,
                                          style: context.bodyLarge),
                                      Text(yarn.user!.businessDetail!.accountType!,
                                          style: context.labelSmall)
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconPrefixedText(
                                      icon: Icons.location_on_outlined,
                                      label: yarn.user?.businessDetail?.address ?? "Unknown",
                                      iconColor: Colors.grey,
                                    ),
                                    IconPrefixedText(
                                      icon: Icons.access_time_outlined,
                                      label: 'Updated ${getShortDateString(yarn.updatedAt!)}',
                                      iconColor: Colors.grey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          15.vSpace,
                          const Divider(
                            height: 1,
                          )
                        ],
                      ),
                    ),
                    bottom: TabBar(
                      tabs: const [
                        Text('Overview'),
                        Text('Seller'),
                        Text(
                          'Associated Brokers',
                          textAlign: TextAlign.center,
                        ),
                      ],
                      indicatorColor: context.primaryColor,
                    ),
                  ),
                  body: TabBarView(children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabeledIconButton(
                                iconData: Icons.lock,
                                label: 'Buy this yarn',
                                iconColor: context.primaryColor,
                                onTap: controller.onBuyThisYarn,
                              ),
                              10.hSpace,
                              LabeledIconButton(
                                iconData: Icons.request_page_outlined,
                                label: 'Request A Quote',
                                iconColor: context.primaryColor,
                                onTap: controller.onRequestQuote,
                              ),
                              10.hSpace,
                              LabeledIconButton(
                                iconData: Icons.format_align_center,
                                label: 'Request Sample',
                                iconColor: context.primaryColor,
                                onTap: controller.onRequestSample,
                              ),
                            ],
                          ),
                          10.vSpace,
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Yarn Type", style: context.labelMedium),
                                      Text(yarn.yarnType, style: context.bodyLarge)
                                    ],
                                  ),
                                  Divider(height: 26),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Purpose", style: context.labelMedium),
                                      Text(yarn.purpose, style: context.bodyLarge)
                                    ],
                                  ),
                                  Divider(height: 26),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Count", style: context.labelMedium),
                                      Text(yarn.count, style: context.bodyLarge)
                                    ],
                                  ),
                                  Divider(height: 26),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delivery Details", style: context.labelMedium),
                                      Text(yarn.deliveryPeriod, style: context.bodyLarge)
                                    ],
                                  ),
                                  Divider(height: 26),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Payment Term", style: context.labelMedium),
                                      Text(yarn.paymentTerms.value, style: context.bodyLarge)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          20.vSpace,
                          Text(
                            "Same Product from other sellers",
                            style: context.titleSmall,
                          ),
                          ViewModelBuilder.withController<YarnsViewModel,
                                  FetchSimilarYarnsController>(
                              create: () => FetchSimilarYarnsController(context, yarn),
                              builder: (context, controller, yarnViewModel) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                                  child: YarnListView(
                                    pricesViewModel: yarnViewModel!,
                                    onReload: controller.onReload,
                                    onWatchlist: controller.onWatchlist,
                                    onCompare: controller.onCompare,
                                    onDetail: controller.onDetail,
                                    onShare: controller.onShare,
                                    onHeaderTap: controller.onHeaderTap,
                                  ),
                                );
                              }),
                              15.vSpace,
                        ]),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SellerView(
                          sellerViewModel: SellerViewModel(
                            companyName: yarn.user!.businessDetail!.companyName!,
                            location: yarn.user!.businessDetail!.address ?? "Unknown",
                            lastUpdated: getShortDateWithOutDayOfWeekString(yarn.updatedAt!),
                            sellerType: yarn.user!.businessDetail!.accountType
                                !.getUserType()
                                .getShortString(),
                          ),
                          onWatchlist: controller.onWatchlist,
                          onShare: controller.onShareUser,
                          onDetail: controller.onDetail,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                      width: 1,
                    )
                  ]),
                ),
              );
            });
  }
}
