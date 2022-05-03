import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/models/prices_view_model.dart';
import 'package:yarn_bazaar/presentation/views/seller_view.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class PriceListDetailPage extends StatelessWidget {
  const PriceListDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceViewModel =
        ModalRoute.of(context)?.settings.arguments as PriceViewModel;
    final size = MediaQuery.of(context).size;
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
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            color: Colors.grey,
                            onPressed: () {},
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
                                  priceViewModel.yarnQuality.split(' ')[0],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                color: priceViewModel.sellerType == "Mill"
                                    ? Colors.blue
                                    : Colors.green,
                                padding: const EdgeInsets.all(8),
                              ),
                              8.hSpace,
                              Text(
                                priceViewModel.yarnQuality.split(' ')[1],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabeledIconButton(
                    iconData: Icons.lock,
                    label: 'Buy this yarn',
                    iconColor: context.primaryColor,
                    onTap: () {},
                  ),
                  10.hSpace,
                  LabeledIconButton(
                    iconData: Icons.request_page_outlined,
                    label: 'Request A Quote',
                    iconColor: context.primaryColor,
                    onTap: () {},
                  ),
                  10.hSpace,
                  LabeledIconButton(
                    iconData: Icons.format_align_center,
                    label: 'Request Sample',
                    iconColor: context.primaryColor,
                    onTap: () {},
                  ),
                ],
              )
            ]),
          ),
          SellerView(
            directoryViewModel: DirectoryViewModel.defaults(),
            onWatchlist: () {},
            onShare: () {},
            onDetail: () {},
          ),
          const SizedBox(
            height: 1,
            width: 1,
          )
        ]),
      ),
    );
  }
}
