import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/formatter_mixin.dart';
import 'package:yarn_bazaar/presentation/models/seller_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/my_image_view.dart';

class SellerView extends StatelessWidget with FormatterMixin {
  final SellerViewModel sellerViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onShare;
  final VoidCallback onDetail;

  const SellerView({
    Key? key,
    required this.sellerViewModel,
    required this.onWatchlist,
    required this.onShare,
    required this.onDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyCircleAvatar(
                    radius: 24,
                    initials: getInitials(sellerViewModel.companyName),
                    backgroundColor: sellerViewModel.sellerType.getAccountTypeColor(),
                    textStyle: context.bodyLarge?.copyWith(
                      color: Colors.white,
                    )),
                15.hSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(sellerViewModel.companyName, style: context.titleSmall),
                    Row(
                      children: [
                        IconPrefixedText(
                          icon: Icons.location_on_outlined,
                          label: sellerViewModel.location,
                          iconColor: Colors.black87,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            8.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconPrefixedText(
                  icon: Icons.access_time,
                  label: 'Price last updated ${sellerViewModel.lastUpdated}',
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  iconColor: Colors.grey,
                )
              ],
            ),
            10.vSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Seller Type: ',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  sellerViewModel.sellerType,
                  style: TextStyle(
                    color: sellerViewModel.sellerType.getAccountTypeColor(),
                  ),
                )
              ],
            ),
            10.vSpace,
            const Divider(),
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
