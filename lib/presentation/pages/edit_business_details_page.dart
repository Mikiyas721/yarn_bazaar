import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/edit_business_detail_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_business_detail_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditBusinessDetailPage extends StatelessWidget {
  const EditBusinessDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          title: const Text('Edit Business Details'),
        ),
        body: EditBusinessDetailView(
          editBusinessDetailViewModel: EditBusinessDetailViewModel.defaults(),
          onCompanyName: (String companyName) {},
          onAccountType: () {},
          onAddress: (String address) {},
          onCompleteAddress: (String completeAddress) {},
          onGSTNo: (String gstNo) {},
          onTANNo: (String tanNo) {},
          onGSTDocument: () {},
          onPANNo: (String panNo) {},
          onPANCardDocument: () {},
          onSave: () {},
        ));
  }
}
