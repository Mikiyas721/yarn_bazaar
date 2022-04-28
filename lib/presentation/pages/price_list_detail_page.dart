import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/models/prices_view_model.dart';
import 'package:yarn_bazaar/presentation/views/seller_view.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/widgets/labeled_icon_button.dart';
import 'package:yarn_bazaar/common/extensions.dart';

class PriceListDetailPage extends StatelessWidget {
  const PriceListDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceViewModel =
        ModalRoute.of(context)?.settings.arguments as PriceViewModel;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.26,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(priceViewModel.yarnQuality.split(' ')[0]),
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
        ),
        bottom: const TabBar(tabs: [
          Text('Overview'),
          Text('Seller'),
          Text('Associated Brokers'),
        ]),
      ),
      body: TabBarView(children: [
        Column(children: [
          Row(
            children: [
              LabeledIconButton(
                iconData: Icons.lock,
                label: 'Buy this yarn',
                iconColor: context.primaryColor,
                onTap: () {},
              ),
              LabeledIconButton(
                iconData: Icons.request_page_outlined,
                label: 'Request A Quote',
                iconColor: context.primaryColor,
                onTap: () {},
              ),
              LabeledIconButton(
                iconData: Icons.format_align_center,
                label: 'Request Sample',
                iconColor: context.primaryColor,
                onTap: () {},
              ),
            ],
          )
        ]),
        SellerView(
          directoryViewModel: DirectoryViewModel.defaults(),
          onWatchlist: () {},
          onShare: () {},
          onDetail: () {},
        ),
        const SizedBox(height: 1,width: 1,)
      ]),
    );
  }
}
