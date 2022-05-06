part of 'edit_basic_information_bloc.dart';

@freezed
abstract class EditBasicInformationState extends BlocState
    with _$EditBasicInformationState {
  const factory EditBasicInformationState({
    required Either<NameFailure, Name> firstName,
    required Either<NameFailure, Name> lastName,
    required Either<YearFailure, Year> inBusinessSince,
    required Either<PhoneNumberFailure, PhoneNumber> primaryNumber,
    String? country,
    String? city,
    required Either<EmailFailure, Email> email,
    required Either<WebsiteUrlFailure, WebsiteUrl> website,
    required bool hasSubmitted,
    required bool isSaving,
  }) = _EditBasicInformationState;

  factory EditBasicInformationState.initial() => EditBasicInformationState(
        firstName: Name.create(''),
        lastName: Name.create(''),
        inBusinessSince: Year.create(''),
        primaryNumber: PhoneNumber.create(''),
        email: Email.create(''),
        website: WebsiteUrl.create(''),
        hasSubmitted: false,
        isSaving: false,
      );
}
