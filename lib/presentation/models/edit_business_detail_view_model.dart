import 'package:yarn_bazaar/common/view_model.dart';

class EditBusinessDetailViewModel extends ViewModel {
  final bool isLoadingSaved;
  final String? error;
  final String? companyName;
  final String? companyNameError;
  final String? accountType;
  final String? address;
  final String? addressError;
  final String? completeAddress;
  final String? completeAddressError;
  final String? gstNo;
  final String? gstNoError;
  final String? tanNo;
  final String? tanNoError;
  final String? panNo;
  final String? panNoError;
  final bool isSaving;

  EditBusinessDetailViewModel({
    required this.isLoadingSaved,
    this.error,
    required this.companyName,
    this.companyNameError,
    required this.accountType,
    required this.address,
    this.addressError,
    required this.completeAddress,
    this.completeAddressError,
    required this.gstNo,
    this.gstNoError,
    required this.tanNo,
    this.tanNoError,
    required this.panNo,
    this.panNoError,
    required this.isSaving,
  });

  @override
  List<Object?> get props => [
        isLoadingSaved,
        error,
        companyName,
        companyNameError,
        accountType,
        address,
        addressError,
        completeAddress,
        completeAddressError,
        gstNo,
        gstNoError,
        tanNo,
        tanNoError,
        panNo,
        panNoError,
        isSaving,
      ];
}
