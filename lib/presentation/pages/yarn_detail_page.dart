import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/presentation/controllers/fetch_similar_yarns_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/yarn_detail_controller.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
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
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                          color: yarn.user?.businessDetail?.accountType ==
                                                      UserType.yarn_manufacturer.getString() ||
                                                  yarn.user?.businessDetail?.accountType ==
                                                      UserType.fabric_manufacturer.getString()
                                              ? Colors.blue
                                              : Colors.green,
                                          padding: const EdgeInsets.all(8),
                                        ),
                                        8.hSpace,
                                        Text(
                                          yarn.yarnType,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '\$${yarn.quantityInKgs}/Kg',
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
                                      Text(yarn.user!.businessDetail!.companyName),
                                      Text(
                                        yarn.user!.businessDetail!.accountType
                                            .getUserType()
                                            .getShortString(),
                                        style:
                                            const TextStyle(color: Colors.grey, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconPrefixedText(
                                      icon: Icons.location_on_outlined,
                                      label: yarn.user?.businessDetail?.address ?? "Unknown",
                                      color: Colors.grey,
                                    ),
                                    IconPrefixedText(
                                      icon: Icons.access_time_outlined,
                                      label: 'Updated ${getShortDateString(yarn.updatedAt!)}',
                                      color: Colors.grey,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: SingleChildScrollView(
                        child: Column(children: [
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Yarn Type"),
                                    Text(yarn.yarnType)
                                  ],
                                ),
                                Divider(height: 1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Purpose"),
                                    Text(yarn.purpose)
                                  ],
                                ),
                                Divider(height: 1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Count"),
                                    Text(yarn.count)
                                  ],
                                ),
                                Divider(height: 1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivery Details"),
                                    Text(yarn.deliveryPeriod)
                                  ],
                                ),
                                Divider(height: 1),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Payment Term"),
                                    Text(yarn.paymentTerms.value)
                                  ],
                                ),
                                Divider(height: 1),
                              ],
                            ),
                          ),
                          20.vSpace,
                          Text("Same Product from other sellers"),
                          ViewModelBuilder.withController<YarnsViewModel, FetchSimilarYarnsController>(
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
                              })
                        ]),
                      ),
                    ),
                    SellerView(
                      userViewModel: UserViewModel(
                        companyName: yarn.user!.businessDetail!.companyName,
                        location: yarn.user!.businessDetail!.address ?? "Unknown",
                        numberOfYarnProducts: yarn.user!.yarns!.length,
                        lastUpdated: getShortDateWithOutDayOfWeekString(yarn.updatedAt!),
                        sellerType: yarn.user!.businessDetail!.accountType
                            .getUserType()
                            .getShortString(),
                      ),
                      onWatchlist: controller.onWatchlist,
                      onShare: controller.onShareUser,
                      onDetail: controller.onDetail,
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
