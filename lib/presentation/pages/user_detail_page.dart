import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/formatter_mixin.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/user_detail_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/user_yarns_controller.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/presentation/views/yarn_list_view.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

class UserDetailPage extends StatelessWidget with FormatterMixin {
  static const route = '/userDetailPage';
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User?;
    final size = MediaQuery.of(context).size;
    return user == null
        ? Scaffold(body: Center(child: Text('Unable to find selected User')))
        : ControllerProvider<UserDetailController>(
            create: () => UserDetailController(context),
            builder: (context, controller) {
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: size.height * 0.145,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const PopButton(
                                  iconColor: Colors.grey,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.favorite_border),
                                      color: Colors.grey,
                                      onPressed: controller.onFavourite,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.share),
                                      color: Colors.grey,
                                      onPressed: controller.onShare,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          5.vSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  child: Text(
                                    getInitials(user.businessDetail?.companyName),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: (user.businessDetail?.accountType ==
                                              UserType.yarn_manufacturer.getString() ||
                                          user.businessDetail?.accountType ==
                                              UserType.fabric_manufacturer.getString())
                                      ? Colors.blue
                                      : Colors.green,
                                ),
                                15.hSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.businessDetail!.companyName,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3),
                                      child: Row(
                                        children: [
                                          IconPrefixedText(
                                            icon: Icons.location_on_outlined,
                                            label: user.businessDetail?.address ?? 'Unknown',
                                            color: Colors.black87,
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Seller Type: ',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                        Text(
                                          user.businessDetail!.accountType
                                              .getUserType()
                                              .getShortString(),
                                          style: TextStyle(
                                              color: user.businessDetail?.accountType ==
                                                          UserType.yarn_manufacturer
                                                              .getString() ||
                                                      user.businessDetail?.accountType ==
                                                          UserType.fabric_manufacturer
                                                              .getString()
                                                  ? Colors.blue
                                                  : Colors.green),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          10.vSpace,
                          const Divider(
                            height: 1,
                          )
                        ],
                      ),
                    ),
                    bottom: TabBar(
                      labelPadding: const EdgeInsets.only(bottom: 10),
                      tabs: const [
                        Text(
                          'Contact Details',
                          textAlign: TextAlign.center,
                        ),
                        Text('Products'),
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
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Notes"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Seller Type"),
                                        Text(user.businessDetail!.accountType)
                                      ],
                                    ),
                                    Divider(height: 1),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Yarn Categories"),
                                        Text(listHorizontally(user.businessDetail!.categories))
                                      ],
                                    ),
                                    Divider(height: 1),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Member Since"),
                                        Text(user.createdAt!.year.toString())
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              10.vSpace,
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Contact Details"),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_outline,
                                        ),
                                        15.hSpace,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Contact Person"),
                                            Text(
                                                "${user.firstName.value} ${user.lastName?.value ?? ''}"),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    ViewModelBuilder.withController<YarnsViewModel, UserYarnsController>(
                        create: () => UserYarnsController(context, user.id!),
                        onInit: (controller) => controller.setUserYarns(user.yarns!),
                        builder: (context, controller, yarnViewModel) {
                          return RefreshIndicator(
                            child: Padding(
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
                            ),
                            onRefresh: controller.onRefresh,
                          );
                        }),
                    SizedBox(
                      height: 1,
                      width: 1,
                    )
                  ]),
                ),
              );
            });
  }
}
