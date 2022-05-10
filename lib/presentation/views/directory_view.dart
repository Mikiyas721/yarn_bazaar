import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/empty_error_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/simple_list_view.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class DirectoriesView extends StatelessWidget {
  final UsersViewModel directoriesViewModel;
  final VoidCallback onReload;
  final Function(UserViewModel directoryViewModel) onWatchlist;
  final Function(UserViewModel directoryViewModel) onDetail;
  final Function(UserViewModel directoryViewModel) onShare;

  const DirectoriesView({
    Key? key,
    required this.directoriesViewModel,
    required this.onReload,
    required this.onWatchlist,
    required this.onDetail,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MyExpansionPanelList<UserViewModel>(
          model: directoriesViewModel,
          itemBuilder: (BuildContext context,
              UserViewModel directoryViewModel, int index) {
            return DirectoryView._(
              directoryViewModel: directoryViewModel,
              onWatchlist: () {
                onWatchlist(directoryViewModel);
              },
              onDetail: () {
                onDetail(directoryViewModel);
              },
              onShare: () {
                onShare(directoryViewModel);
              },
              expanded: index == 1,
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
          )),
    );
  }
}

class DirectoryView extends ExpansionPanel {
  final UserViewModel directoryViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onShare;
  final VoidCallback onDetail;
  final bool expanded;

  DirectoryView._({
    required this.directoryViewModel,
    required this.onWatchlist,
    required this.onShare,
    required this.onDetail,
    required this.expanded,
  }) : super(
            canTapOnHeader: true,
            hasIcon: false,
            isExpanded: expanded,
            headerBuilder: (BuildContext context, bool isShowing) {
              return Padding(
                padding: expanded
                    ? const EdgeInsets.symmetric(horizontal: 15)
                    : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
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
                    8.vSpace,
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
                )));
}
