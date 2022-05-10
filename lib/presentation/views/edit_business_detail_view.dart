import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/edit_business_detail_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';

class EditBusinessDetailView extends StatelessWidget {
  final EditBusinessDetailViewModel editBusinessDetailViewModel;
  final Function(String companyName) onCompanyName;
  final VoidCallback onAccountType;
  final Function(String address) onAddress;
  final Function(String completeAddress) onCompleteAddress;
  final Function(String gstNo) onGSTNo;
  final Function(String tanNo) onTANNo;
  final VoidCallback onGSTDocument;
  final Function(String panNo) onPANNo;
  final VoidCallback onPANCardDocument;
  final VoidCallback onSave;

  const EditBusinessDetailView({
    Key? key,
    required this.editBusinessDetailViewModel,
    required this.onCompanyName,
    required this.onAccountType,
    required this.onAddress,
    required this.onCompleteAddress,
    required this.onGSTNo,
    required this.onTANNo,
    required this.onGSTDocument,
    required this.onPANNo,
    required this.onPANCardDocument,
    required this.onSave,
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
                    title: 'Company Name',
                    textFieldValue: editBusinessDetailViewModel.companyName,
                    errorMessage: editBusinessDetailViewModel.companyNameError,
                    hintText: 'xyz enterprise',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onCompanyName,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Account Type',
                    textFieldValue: editBusinessDetailViewModel.accountType,
                    hintText: 'Trader',
                    usesPrimaryColor: false,
                    onTap: onAccountType,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Address',
                    textFieldValue: editBusinessDetailViewModel.address,
                    errorMessage: editBusinessDetailViewModel.addressError,
                    hintText: 'Addis, Ethiopia',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onAddress,
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                    title: 'Complete Address',
                    textFieldValue: editBusinessDetailViewModel.completeAddress,
                    errorMessage:
                        editBusinessDetailViewModel.completeAddressError,
                    hintText: 'Complete Address',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onCompleteAddress,
                  ),
                  15.vSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFieldWithTitle(
                          title: 'GST No',
                          textFieldValue:
                              editBusinessDetailViewModel.gstNo,
                          errorMessage:
                              editBusinessDetailViewModel.gstNoError,
                          hintText: '22AAAAA0000A1Z5',
                          usesPrimaryColor: false,
                          fieldIsOptional: false,
                          onChanged: onGSTNo,
                        ),
                      ),
                      15.hSpace,
                      Expanded(
                        flex: 1,
                        child: TextFieldWithTitle(
                          title: 'TAN No',
                          textFieldValue:
                              editBusinessDetailViewModel.tanNo,
                          errorMessage:
                              editBusinessDetailViewModel.tanNoError,
                          hintText: 'AAAA99999A',
                          usesPrimaryColor: false,
                          fieldIsOptional: false,
                          onChanged: onTANNo,
                        ),
                      )
                    ],
                  ),
                  TextFieldWithTitle(
                    title: 'Business PAN Number',
                    readOnly: true,
                    enabled: false,
                    textFieldValue: editBusinessDetailViewModel.panNo,
                    errorMessage: editBusinessDetailViewModel.panNoError,
                    hintText: 'AAAAA8888A',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    onChanged: onPANNo,
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
              isLoading: editBusinessDetailViewModel.isSaving,
            ))
      ],
    );
  }
}
