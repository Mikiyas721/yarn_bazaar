import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class SellerView extends StatelessWidget {
  final UserViewModel directoryViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onShare;
  final VoidCallback onDetail;

  const SellerView({
    Key? key,
    required this.directoryViewModel,
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
                CircleAvatar(
                  radius: 24,
                  child: Text(
                    directoryViewModel.initials,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: directoryViewModel.sellerType == "Mill"
                      ? Colors.blue
                      : Colors.green,
                ),
                15.hSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      directoryViewModel.companyName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconPrefixedText(
                          icon: Icons.location_on_outlined,
                          label: directoryViewModel.location,
                          color: Colors.black87,
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
                Text(
                    '${directoryViewModel.numberOfYarnProducts} Yarn Products'),
                IconPrefixedText(
                  icon: Icons.access_time,
                  label: 'Price last updated ${directoryViewModel.lastUpdated}',
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  color: Colors.grey,
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
                  directoryViewModel.sellerType,
                  style: TextStyle(
                      color: directoryViewModel.sellerType == "Mill"
                          ? Colors.blue
                          : Colors.green),
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
