part of 'edit_bank_details_bloc.dart';

@freezed
abstract class EditBankDetailsState extends BlocState with _$EditBankDetailsState {
  const factory EditBankDetailsState({
    required bool isLoadingSaved,
    String? accountName,
    required Either<AccountNumberFailure, AccountNumber> accountNumber,
    required Either<IFSCCodeFailure, IFSCCode> iFSCCode,
    String? bankName,
    String? bankBranch,
    String? bankState,
    String? bankCity,
    required bool hasSubmitted,
    required bool isSaving,
  }) = _EditBankDetailsState;

  factory EditBankDetailsState.initial()=>
      EditBankDetailsState(
        isLoadingSaved: true,
        accountNumber: AccountNumber.create(''),
        iFSCCode: IFSCCode.create(''),
        hasSubmitted: false,
        isSaving: false,
      );
}
