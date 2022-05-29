part of 'edit_bank_details_bloc.dart';

@freezed
abstract class EditBankDetailsState extends BlocState with _$EditBankDetailsState {
  const factory EditBankDetailsState({
    required bool isLoadingSaved,
    required Option<BankDetail> loadedBankDetails,
    required Option<Failure> loadingSavedFailure,
    String? accountName,
    required Either<AccountNumberFailure, AccountNumber> accountNumber,
    required Either<IFSCCodeFailure, IFSCCode> iFSCCode,
    String? bankName,
    String? bankBranch,
    String? bankState,
    String? bankCity,
    required Option<FilePickerCross> addressSelectedFile,
    required Option<FilePickerCross> chequeSelectedFile,
    required bool hasSubmitted,
    required bool isSaving,
  }) = _EditBankDetailsState;

  factory EditBankDetailsState.initial() => EditBankDetailsState(
        isLoadingSaved: true,
        loadedBankDetails: none(),
        loadingSavedFailure: none(),
        accountNumber: AccountNumber.create(''),
        iFSCCode: IFSCCode.create(''),
        addressSelectedFile: none(),
        chequeSelectedFile: none(),
        hasSubmitted: false,
        isSaving: false,
      );
}
