import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_all_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/bottom_navigation_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/drawer_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_cotton_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_cp_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_fancy_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_linen_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_modal_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_pc_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_psf_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_pv_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_rayon_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_texturize_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_viscose_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/yarns_worsted_wool_controller.dart';
import 'package:yarn_bazaar/presentation/models/bottom_navigation_bar_view_model.dart';
import 'package:yarn_bazaar/presentation/models/drawer_view_model.dart';
import 'package:yarn_bazaar/presentation/models/yarns_view_model.dart';
import 'package:yarn_bazaar/presentation/views/bottom_navigation_bar_view.dart';
import 'package:yarn_bazaar/presentation/views/drawer_view.dart';
import 'package:yarn_bazaar/presentation/views/yarn_list_view.dart';
import 'package:yarn_bazaar/presentation/widgets/search_field.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class PriceListPage extends StatelessWidget {
  static const route = '/priceListPage';
  const PriceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Text('All'),
      Text('Cotton'),
      Text('Texturize'),
      Text('PSF'),
      Text('PC'),
      Text('PV'),
      Text('Viscose'),
      Text('CP'),
      Text('Linen'),
      Text('Modal'),
      Text('Rayon'),
      Text('Fancy'),
      Text('Worsted Wool'),
    ];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          drawer: ViewModelBuilder.withController<DrawerViewModel, MyDrawerController>(
              create: () => MyDrawerController(context),
              builder: (context, controller, viewModel) {
                return DrawerView(
                  drawerViewModel: viewModel!,
                  onEditAccount: controller.onEditAccount,
                  onLogout: controller.onLogout,
                  onDrawerItemClicked: controller.onDrawerItemClicked,
                );
              }),
          appBar: AppBar(
            title: SearchField(
              onDiscardText: () {},
              onTap: () {},
              onChanged: (String input) {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: () {},
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelPadding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
              tabs: tabs,
              indicatorColor: context.primaryColor,
            ),
          ),
          body: TabBarView(children: [
            ViewModelBuilder.withController<YarnsViewModel, AllYarnsController>(
                create: () => AllYarnsController(context),
                onInit: (controller) => controller.loadAllYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, CottonYarnsController>(
                create: () => CottonYarnsController(context),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, TexturizeYarnsController>(
                create: () => TexturizeYarnsController(context),
                onInit: (controller) => controller.loadTexturizeYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, PsfYarnsController>(
                create: () => PsfYarnsController(context),
                onInit: (controller) => controller.loadPsfYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, PcYarnsController>(
                create: () => PcYarnsController(context),
                onInit: (controller) => controller.loadPcYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, PvYarnsController>(
                create: () => PvYarnsController(context),
                onInit: (controller) => controller.loadPvYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, ViscoseYarnsController>(
                create: () => ViscoseYarnsController(context),
                onInit: (controller) => controller.loadViscoseYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, CPYarnsController>(
                create: () => CPYarnsController(context),
                onInit: (controller) => controller.loadCpYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, LinenYarnsController>(
                create: () => LinenYarnsController(context),
                onInit: (controller) => controller.loadLinenYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, ModalYarnsController>(
                create: () => ModalYarnsController(context),
                onInit: (controller) => controller.loadModalYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, RayonYarnsController>(
                create: () => RayonYarnsController(context),
                onInit: (controller) => controller.loadRayonYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, FancyYarnsController>(
                create: () => FancyYarnsController(context),
                onInit: (controller) => controller.loadFancyYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                }),
            ViewModelBuilder.withController<YarnsViewModel, WorstedWoolYarnsController>(
                create: () => WorstedWoolYarnsController(context),
                onInit: (controller) => controller.loadWorstedWoolYarns(),
                builder: (context, controller, yarnViewModel) {
                  return RefreshIndicator(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: YarnListView(
                        pricesViewModel: yarnViewModel!,
                        onReload: controller.onReload,
                        onWatchlist: controller.onWatchlist,
                        onCompare: controller.onCompare,
                        onDetail: controller.onDetail,
                        onShare: controller.onShare,
                        onHeaderTap: controller.onHeaderTap,
                      ),
                    ),
                    onRefresh: controller.onRefresh,
                  );
                })
          ]),
          bottomNavigationBar: ViewModelBuilder.withController<BottomNavigationBarViewModel,
                  BottomNavigationController>(
              create: () => BottomNavigationController(context),
              onInit: (controller) => controller.switchTo(1),
              builder: (context, controller, viewModel) {
                return BottomNavigationBarView(
                  bottomNavigationBarViewModel: viewModel!,
                  onItemSelected: controller.onNavigate,
                );
              }),
        ));
  }
}
