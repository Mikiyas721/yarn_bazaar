import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class DirectoryDetailPage extends StatelessWidget {
  const DirectoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final directoryViewModel =
        ModalRoute.of(context)?.settings.arguments as DirectoryViewModel;
    final size = MediaQuery.of(context).size;
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
                5.vSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              children: [
                                IconPrefixedText(
                                  icon: Icons.location_on_outlined,
                                  label: directoryViewModel.location,
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
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                directoryViewModel.sellerType,
                                style: TextStyle(
                                    color:
                                        directoryViewModel.sellerType == "Mill"
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
        body: const TabBarView(children: [
          SizedBox(
            height: 1,
            width: 1,
          ),
          SizedBox(
            height: 1,
            width: 1,
          ),
          SizedBox(
            height: 1,
            width: 1,
          )
        ]),
      ),
    );
  }
}
