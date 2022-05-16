import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/empty_error_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/simple_list_view.dart';
import 'package:yarn_bazaar/presentation/models/users_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class UserListView extends StatelessWidget {
  final UsersViewModel userViewModel;
  final VoidCallback onReload;
  final Function(UserViewModel directoryViewModel) onWatchlist;
  final Function(UserViewModel directoryViewModel) onDetail;
  final Function(UserViewModel directoryViewModel) onShare;
  final Function (int index, bool wasExpanded) onHeaderTap;

  const UserListView({
    Key? key,
    required this.userViewModel,
    required this.onReload,
    required this.onWatchlist,
    required this.onDetail,
    required this.onShare,
    required this.onHeaderTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MyExpansionPanelList<UserViewModel>(
          model: userViewModel,
          itemBuilder: (BuildContext context,
              UserViewModel directoryViewModel, int index) {
            return UserView._(
              userViewModel: directoryViewModel,
              onWatchlist: () {
                onWatchlist(directoryViewModel);
              },
              onDetail: () {
                onDetail(directoryViewModel);
              },
              onShare: () {
                onShare(directoryViewModel);
              },
              expanded: index == userViewModel.expandedIndex,
              onHeaderTap: (bool wasExpanded){
                onHeaderTap(index, wasExpanded);
              }
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

class UserView extends ExpansionPanel {
  final UserViewModel userViewModel;
  final VoidCallback onWatchlist;
  final VoidCallback onShare;
  final VoidCallback onDetail;
  final bool expanded;
  final Function (bool wasExpanded) onHeaderTap;

  UserView._({
    required this.userViewModel,
    required this.onWatchlist,
    required this.onShare,
    required this.onDetail,
    required this.expanded,
    required this.onHeaderTap,
  }) : super(
            canTapOnHeader: true,
            hasIcon: false,
            isExpanded: expanded,
            headerBuilder: (BuildContext context, bool isShowing) {
              return InkWell(
                onTap: (){
                  onHeaderTap(expanded);
                },
                child: Padding(
                  padding: expanded
                      ? const EdgeInsets.symmetric(horizontal: 15)
                      : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        child: Text(
                          userViewModel.initials,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: userViewModel.sellerType == "Mill"
                            ? Colors.blue
                            : Colors.green,
                      ),
                      15.hSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userViewModel.companyName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconPrefixedText(
                                icon: Icons.location_on_outlined,
                                label: userViewModel.location,
                                color: Colors.black87,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
                            '${userViewModel.numberOfYarnProducts} Yarn Products'),
                        IconPrefixedText(
                          icon: Icons.access_time,
                          label:
                              'Price last updated ${userViewModel.lastUpdated}',
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
                          userViewModel.sellerType,
                          style: TextStyle(
                              color: userViewModel.sellerType == "Mill"
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
