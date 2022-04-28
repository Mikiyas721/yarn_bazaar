import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/empty_error_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/simple_list_view.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';

class DirectoriesView extends StatelessWidget {
  final DirectoriesViewModel directoriesViewModel;
  final VoidCallback onReload;

  const DirectoriesView({
    Key? key,
    required this.directoriesViewModel,
    required this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyExpansionPanelList<DirectoryViewModel>(
        model: directoriesViewModel,
        itemBuilder:
            (BuildContext context, DirectoryViewModel directoryViewModel) {
          return DirectoryView._(
            directoryViewModel: directoryViewModel,
            onWatchlist: () {},
            onCompare: () {},
            onDetail: () {},
            onShare: () {},
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
        ));
  }
}

class DirectoryView extends ExpansionPanel {
  final DirectoryViewModel directoryViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onCompare;
  final VoidCallback onShare;
  final VoidCallback onDetail;

  DirectoryView._({
    required this.directoryViewModel,
    required this.onWatchlist,
    required this.onCompare,
    required this.onShare,
    required this.onDetail,
  }) : super(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isShowing) {
              return Row(
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
              );
            },
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${directoryViewModel.numberOfYarnProducts} Yarn Products'),
                    IconPrefixedText(
                      icon: Icons.access_time,
                      label:
                          'Price last updated ${directoryViewModel.lastUpdated}',
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
            ));
}
