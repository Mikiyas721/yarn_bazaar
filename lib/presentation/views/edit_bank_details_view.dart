import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/presentation/models/edit_bank_detail_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/empty_error_view.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/my_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/stacked_loading_view.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class EditBankDetailsView extends StatelessWidget {
  final EditBankDetailViewModel editBankDetailViewModel;
  final Function(String accountName) onAccountName;
  final Function(String accountNumber) onAccountNumber;
  final Function(String ifscCode) onIFSCCode;
  final Function(String bankName) onBankName;
  final Function(String bankBranch) onBankBranch;
  final Function(String bankState) onBankState;
  final Function(String bankCity) onBankCity;
  final VoidCallback onAttachAddress;
  final VoidCallback onAttachCheque;
  final VoidCallback onSave;
  final VoidCallback onReload;
  final TextEditingController? accountNameController;
  final TextEditingController? accountNumberController;
  final TextEditingController? iFSCCodeController;
  final TextEditingController? bankNameController;
  final TextEditingController? bankBranchController;
  final TextEditingController? bankStateController;
  final TextEditingController? bankCityController;

  const EditBankDetailsView({
    Key? key,
    required this.editBankDetailViewModel,
    required this.onAccountName,
    required this.onAccountNumber,
    required this.onIFSCCode,
    required this.onBankName,
    required this.onBankBranch,
    required this.onBankState,
    required this.onBankCity,
    required this.onAttachAddress,
    required this.onAttachCheque,
    required this.onSave,
    required this.onReload,
    this.accountNameController,
    this.accountNumberController,
    this.iFSCCodeController,
    this.bankNameController,
    this.bankBranchController,
    this.bankStateController,
    this.bankCityController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFieldWithTitle(
                    title: 'Account Name',
                    controller: accountNameController,
                    errorMessage: editBankDetailViewModel.accountNameError,
                    hintText: 'Enter Account Name',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onAccountName,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Account Number',
                    controller: accountNumberController,
                    errorMessage: editBankDetailViewModel.accountNumberError,
                    hintText: 'Enter Account Number',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onAccountNumber,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'IFSC Code',
                    controller: iFSCCodeController,
                    errorMessage: editBankDetailViewModel.ifscCodeError,
                    keyboardType: TextInputType.number,
                    hintText: '1995',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onIFSCCode,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextFieldWithTitle(
                        title: 'Bank Name',
                        controller: bankNameController,
                        errorMessage: editBankDetailViewModel.bankNameError,
                        hintText: '',
                        usesPrimaryColor: false,
                        fieldIsOptional: false,
                        onChanged: onBankName,
                      )),
                      15.hSpace,
                      Expanded(
                          child: TextFieldWithTitle(
                        title: 'Branch',
                        controller: bankBranchController,
                        errorMessage: editBankDetailViewModel.bankBranchError,
                        hintText: '',
                        usesPrimaryColor: false,
                        fieldIsOptional: false,
                        onChanged: onBankBranch,
                      ))
                    ],
                  ),
                  15.vSpace,
                  Row(
                    children: [
                      Expanded(
                          child: TextFieldWithTitle(
                        title: 'State',
                        controller: bankStateController,
                        errorMessage: editBankDetailViewModel.bankStateError,
                        hintText: '',
                        usesPrimaryColor: false,
                        onChanged: onBankState,
                      )),
                      15.hSpace,
                      Expanded(
                          child: TextFieldWithTitle(
                        title: 'City',
                        controller: bankCityController,
                        errorMessage: editBankDetailViewModel.bankCityError,
                        hintText: '',
                        usesPrimaryColor: false,
                        onChanged: onBankCity,
                      ))
                    ],
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Attach Address Proof',
                    readOnly: true,
                    enabled: false,
                    usesPrimaryColor: false,
                    onTap: onAttachAddress,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Attach Cancelled Cheque',
                    readOnly: true,
                    enabled: false,
                    hintText: 'India',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onTap: onAttachCheque,
                  ),
                  60.vSpace
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: MyActionButton(
              label: 'SAVE',
              onSubmit: onSave,
              isLoading: editBankDetailViewModel.isSaving,
            )),
        MyStackedLoadingView(
          isLoading: editBankDetailViewModel.isLoadingSaved,
          error: editBankDetailViewModel.error,
          onReload: onReload,
        )
      ],
    );
  }
}
