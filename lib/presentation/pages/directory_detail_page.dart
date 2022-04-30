import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/directory_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/icon_prefixed_text.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class DirectoryDetailPage extends StatelessWidget {
  const DirectoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final directoryViewModel =
        ModalRoute.of(context)?.settings.arguments as DirectoryViewModel;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.26,
        leading: const PopButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Row(
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
        bottom: const TabBar(tabs: [
          Text('Contact Details'),
          Text('Products'),
          Text('Associated Brokers'),
        ]),
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
    );
  }
}
