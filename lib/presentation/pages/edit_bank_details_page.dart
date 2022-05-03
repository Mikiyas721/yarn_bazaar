import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/edit_bank_detail_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_bank_details_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditBankDetailsPage extends StatelessWidget {
  const EditBankDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: const Text('Edit Bank Detail'),
      ),
      body: EditBankDetailsView(
        editBankDetailViewModel: EditBankDetailViewModel.defaults(),
        onAccountName: (String accountName) {},
        onAccountNumber: (String accountNumber) {},
        onIFSCCode: (String ifscCode) {},
        onBankName: (String bankName) {},
        onBankBranch: (String bankBranch) {},
        onBankState: (String bankState) {},
        onBankCity: (String bankCity) {},
        onAttachAddress: (){},
        onAttachCheque: (){},
        onSave: () {},
      ),
    );
  }
}
