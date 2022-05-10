import 'package:yarn_bazaar/common/view_model.dart';

class EditBankDetailViewModel extends ViewModel {
  final bool isLoadingSaved;
  final String? accountName;
  final String? accountNameError;
  final String? accountNumber;
  final String? accountNumberError;
  final String? ifscCode;
  final String? ifscCodeError;
  final String? bankName;
  final String? bankNameError;
  final String? bankBranch;
  final String? bankBranchError;
  final String? bankState;
  final String? bankStateError;
  final String? bankCity;
  final String? bankCityError;
  final bool isSaving;

  EditBankDetailViewModel({
    required this.isLoadingSaved,
    required this.accountName,
    this.accountNameError,
    required this.accountNumber,
    this.accountNumberError,
    required this.ifscCode,
    this.ifscCodeError,
    required this.bankName,
    this.bankNameError,
    required this.bankBranch,
    this.bankBranchError,
    required this.bankState,
    this.bankStateError,
    required this.bankCity,
    this.bankCityError,
    required this.isSaving,
  });

  @override
  List<Object?> get props => [
        isLoadingSaved,
        accountName,
        accountNameError,
        accountNumber,
        accountNumberError,
        ifscCode,
        ifscCodeError,
        bankName,
        bankNameError,
        bankBranch,
        bankBranchError,
        bankState,
        bankStateError,
        bankCity,
        bankCityError,
        isSaving,
      ];
}
