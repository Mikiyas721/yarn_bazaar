part of 'edit_business_details_bloc.dart';

@freezed
abstract class EditBusinessDetailsState extends BlocState with _$EditBusinessDetailsState {
  const factory EditBusinessDetailsState({
    required bool isLoadingSaved,
    required Option<BusinessDetail> loadedBusinessDetail,
    required Option<Failure> loadingSavedFailure,
    required Either<CompanyNameFailure, CompanyName> companyName,
    required String accountType,
    required List<String> categories,
    String? address,
    String? completeAddress,
    required Either<GSTNumberFailure, GSTNumber> gstNo,
    required Either<TANNumberFailure, TANNumber> tanNo,
    required Either<PANNumberFailure, PANNumber> panNo,
    required bool hasSubmitted,
    required bool isSaving,
  }) = _EditBusinessDetailsState;

  factory EditBusinessDetailsState.initial() => EditBusinessDetailsState(
        isLoadingSaved: true,
        loadedBusinessDetail: none(),
        loadingSavedFailure: none(),
        companyName: CompanyName.create(''),
        accountType: '',
        categories: [],
        gstNo: GSTNumber.create(''),
        tanNo: TANNumber.create(''),
        panNo: PANNumber.create(''),
        hasSubmitted: false,
        isSaving: false,
      );
}
