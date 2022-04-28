import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';

class SellerView extends StatelessWidget {
  final DirectoryViewModel directoryViewModel;
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
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text(directoryViewModel.initials),
                backgroundColor: directoryViewModel.sellerType == "Mill"
                    ? Colors.blue
                    : Colors.green,
              ),
              Column(
                children: [
                  Text(directoryViewModel.companyName),
                  Row(
                    children: [
                      IconPrefixedText(
                          icon: Icons.location_on_outlined,
                          label: directoryViewModel.location)
                    ],
                  ),
                  const Divider()
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${directoryViewModel.numberOfYarnProducts} Yarn Products'),
              IconPrefixedText(
                icon: Icons.access_time,
                label: 'Price last updated ${directoryViewModel.lastUpdated}',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              )
            ],
          ),
          Text(
            'Seller Type: ${directoryViewModel.sellerType}',
            style: TextStyle(
                color: directoryViewModel.sellerType == "Mill"
                    ? Colors.blue
                    : Colors.green),
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
                  onPressed: onShare,
                  icon: const Icon(Icons.share),
                  label: const Text('Share')),
            ],
          ),
          Center(
            child: OutlinedButton(
              onPressed: onDetail,
              child: const Text('Detail'),
            ),
          )
        ],
      ),
    );
  }
}
