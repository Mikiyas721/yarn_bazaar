// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  int get activeStepIndex => throw _privateConstructorUsedError;
  Either<PhoneNumberFailure, PhoneNumber> get phoneNumber =>
      throw _privateConstructorUsedError;
  bool get hasSubmittedPhoneNumber => throw _privateConstructorUsedError;
  bool get hasAgreedToTerms => throw _privateConstructorUsedError;
  bool get isGeneratingOTP => throw _privateConstructorUsedError;
  bool get isVerifyingOTP => throw _privateConstructorUsedError;
  bool get hasGeneratedOTP => throw _privateConstructorUsedError;
  String? get generatedOTP => throw _privateConstructorUsedError;
  Either<VerificationCodeFailure, VerificationCode> get userEnteredOTP =>
      throw _privateConstructorUsedError;
  bool get hasSubmittedOTP => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  Either<OtherUserTypeFailure, OtherUserType> get otherUserType =>
      throw _privateConstructorUsedError;
  bool get hasSubmittedUserType => throw _privateConstructorUsedError;
  List<bool> get yarnCategorySelected => throw _privateConstructorUsedError;
  Either<NameFailure, Name> get firstName => throw _privateConstructorUsedError;
  Either<NameFailure, Name> get lastName => throw _privateConstructorUsedError;
  Either<CompanyNameFailure, CompanyName> get companyName =>
      throw _privateConstructorUsedError;
  Either<PasswordFailure, Password> get password =>
      throw _privateConstructorUsedError;
  bool get hasSubmittedUserInformation => throw _privateConstructorUsedError;
  bool get isAddingUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
  $Res call(
      {int activeStepIndex,
      Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      bool hasSubmittedPhoneNumber,
      bool hasAgreedToTerms,
      bool isGeneratingOTP,
      bool isVerifyingOTP,
      bool hasGeneratedOTP,
      String? generatedOTP,
      Either<VerificationCodeFailure, VerificationCode> userEnteredOTP,
      bool hasSubmittedOTP,
      UserType userType,
      Either<OtherUserTypeFailure, OtherUserType> otherUserType,
      bool hasSubmittedUserType,
      List<bool> yarnCategorySelected,
      Either<NameFailure, Name> firstName,
      Either<NameFailure, Name> lastName,
      Either<CompanyNameFailure, CompanyName> companyName,
      Either<PasswordFailure, Password> password,
      bool hasSubmittedUserInformation,
      bool isAddingUser});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;

  @override
  $Res call({
    Object? activeStepIndex = freezed,
    Object? phoneNumber = freezed,
    Object? hasSubmittedPhoneNumber = freezed,
    Object? hasAgreedToTerms = freezed,
    Object? isGeneratingOTP = freezed,
    Object? isVerifyingOTP = freezed,
    Object? hasGeneratedOTP = freezed,
    Object? generatedOTP = freezed,
    Object? userEnteredOTP = freezed,
    Object? hasSubmittedOTP = freezed,
    Object? userType = freezed,
    Object? otherUserType = freezed,
    Object? hasSubmittedUserType = freezed,
    Object? yarnCategorySelected = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? companyName = freezed,
    Object? password = freezed,
    Object? hasSubmittedUserInformation = freezed,
    Object? isAddingUser = freezed,
  }) {
    return _then(_value.copyWith(
      activeStepIndex: activeStepIndex == freezed
          ? _value.activeStepIndex
          : activeStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Either<PhoneNumberFailure, PhoneNumber>,
      hasSubmittedPhoneNumber: hasSubmittedPhoneNumber == freezed
          ? _value.hasSubmittedPhoneNumber
          : hasSubmittedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAgreedToTerms: hasAgreedToTerms == freezed
          ? _value.hasAgreedToTerms
          : hasAgreedToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingOTP: isGeneratingOTP == freezed
          ? _value.isGeneratingOTP
          : isGeneratingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyingOTP: isVerifyingOTP == freezed
          ? _value.isVerifyingOTP
          : isVerifyingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      hasGeneratedOTP: hasGeneratedOTP == freezed
          ? _value.hasGeneratedOTP
          : hasGeneratedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      generatedOTP: generatedOTP == freezed
          ? _value.generatedOTP
          : generatedOTP // ignore: cast_nullable_to_non_nullable
              as String?,
      userEnteredOTP: userEnteredOTP == freezed
          ? _value.userEnteredOTP
          : userEnteredOTP // ignore: cast_nullable_to_non_nullable
              as Either<VerificationCodeFailure, VerificationCode>,
      hasSubmittedOTP: hasSubmittedOTP == freezed
          ? _value.hasSubmittedOTP
          : hasSubmittedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      otherUserType: otherUserType == freezed
          ? _value.otherUserType
          : otherUserType // ignore: cast_nullable_to_non_nullable
              as Either<OtherUserTypeFailure, OtherUserType>,
      hasSubmittedUserType: hasSubmittedUserType == freezed
          ? _value.hasSubmittedUserType
          : hasSubmittedUserType // ignore: cast_nullable_to_non_nullable
              as bool,
      yarnCategorySelected: yarnCategorySelected == freezed
          ? _value.yarnCategorySelected
          : yarnCategorySelected // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Either<NameFailure, Name>,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Either<NameFailure, Name>,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as Either<CompanyNameFailure, CompanyName>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      hasSubmittedUserInformation: hasSubmittedUserInformation == freezed
          ? _value.hasSubmittedUserInformation
          : hasSubmittedUserInformation // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingUser: isAddingUser == freezed
          ? _value.isAddingUser
          : isAddingUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$_SignUpStateCopyWith(
          _$_SignUpState value, $Res Function(_$_SignUpState) then) =
      __$$_SignUpStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int activeStepIndex,
      Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      bool hasSubmittedPhoneNumber,
      bool hasAgreedToTerms,
      bool isGeneratingOTP,
      bool isVerifyingOTP,
      bool hasGeneratedOTP,
      String? generatedOTP,
      Either<VerificationCodeFailure, VerificationCode> userEnteredOTP,
      bool hasSubmittedOTP,
      UserType userType,
      Either<OtherUserTypeFailure, OtherUserType> otherUserType,
      bool hasSubmittedUserType,
      List<bool> yarnCategorySelected,
      Either<NameFailure, Name> firstName,
      Either<NameFailure, Name> lastName,
      Either<CompanyNameFailure, CompanyName> companyName,
      Either<PasswordFailure, Password> password,
      bool hasSubmittedUserInformation,
      bool isAddingUser});
}

/// @nodoc
class __$$_SignUpStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements _$$_SignUpStateCopyWith<$Res> {
  __$$_SignUpStateCopyWithImpl(
      _$_SignUpState _value, $Res Function(_$_SignUpState) _then)
      : super(_value, (v) => _then(v as _$_SignUpState));

  @override
  _$_SignUpState get _value => super._value as _$_SignUpState;

  @override
  $Res call({
    Object? activeStepIndex = freezed,
    Object? phoneNumber = freezed,
    Object? hasSubmittedPhoneNumber = freezed,
    Object? hasAgreedToTerms = freezed,
    Object? isGeneratingOTP = freezed,
    Object? isVerifyingOTP = freezed,
    Object? hasGeneratedOTP = freezed,
    Object? generatedOTP = freezed,
    Object? userEnteredOTP = freezed,
    Object? hasSubmittedOTP = freezed,
    Object? userType = freezed,
    Object? otherUserType = freezed,
    Object? hasSubmittedUserType = freezed,
    Object? yarnCategorySelected = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? companyName = freezed,
    Object? password = freezed,
    Object? hasSubmittedUserInformation = freezed,
    Object? isAddingUser = freezed,
  }) {
    return _then(_$_SignUpState(
      activeStepIndex: activeStepIndex == freezed
          ? _value.activeStepIndex
          : activeStepIndex // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as Either<PhoneNumberFailure, PhoneNumber>,
      hasSubmittedPhoneNumber: hasSubmittedPhoneNumber == freezed
          ? _value.hasSubmittedPhoneNumber
          : hasSubmittedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAgreedToTerms: hasAgreedToTerms == freezed
          ? _value.hasAgreedToTerms
          : hasAgreedToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      isGeneratingOTP: isGeneratingOTP == freezed
          ? _value.isGeneratingOTP
          : isGeneratingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerifyingOTP: isVerifyingOTP == freezed
          ? _value.isVerifyingOTP
          : isVerifyingOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      hasGeneratedOTP: hasGeneratedOTP == freezed
          ? _value.hasGeneratedOTP
          : hasGeneratedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      generatedOTP: generatedOTP == freezed
          ? _value.generatedOTP
          : generatedOTP // ignore: cast_nullable_to_non_nullable
              as String?,
      userEnteredOTP: userEnteredOTP == freezed
          ? _value.userEnteredOTP
          : userEnteredOTP // ignore: cast_nullable_to_non_nullable
              as Either<VerificationCodeFailure, VerificationCode>,
      hasSubmittedOTP: hasSubmittedOTP == freezed
          ? _value.hasSubmittedOTP
          : hasSubmittedOTP // ignore: cast_nullable_to_non_nullable
              as bool,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      otherUserType: otherUserType == freezed
          ? _value.otherUserType
          : otherUserType // ignore: cast_nullable_to_non_nullable
              as Either<OtherUserTypeFailure, OtherUserType>,
      hasSubmittedUserType: hasSubmittedUserType == freezed
          ? _value.hasSubmittedUserType
          : hasSubmittedUserType // ignore: cast_nullable_to_non_nullable
              as bool,
      yarnCategorySelected: yarnCategorySelected == freezed
          ? _value._yarnCategorySelected
          : yarnCategorySelected // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Either<NameFailure, Name>,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Either<NameFailure, Name>,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as Either<CompanyNameFailure, CompanyName>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Either<PasswordFailure, Password>,
      hasSubmittedUserInformation: hasSubmittedUserInformation == freezed
          ? _value.hasSubmittedUserInformation
          : hasSubmittedUserInformation // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingUser: isAddingUser == freezed
          ? _value.isAddingUser
          : isAddingUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignUpState implements _SignUpState {
  const _$_SignUpState(
      {required this.activeStepIndex,
      required this.phoneNumber,
      required this.hasSubmittedPhoneNumber,
      required this.hasAgreedToTerms,
      required this.isGeneratingOTP,
      required this.isVerifyingOTP,
      required this.hasGeneratedOTP,
      this.generatedOTP,
      required this.userEnteredOTP,
      required this.hasSubmittedOTP,
      required this.userType,
      required this.otherUserType,
      required this.hasSubmittedUserType,
      required final List<bool> yarnCategorySelected,
      required this.firstName,
      required this.lastName,
      required this.companyName,
      required this.password,
      required this.hasSubmittedUserInformation,
      required this.isAddingUser})
      : _yarnCategorySelected = yarnCategorySelected;

  @override
  final int activeStepIndex;
  @override
  final Either<PhoneNumberFailure, PhoneNumber> phoneNumber;
  @override
  final bool hasSubmittedPhoneNumber;
  @override
  final bool hasAgreedToTerms;
  @override
  final bool isGeneratingOTP;
  @override
  final bool isVerifyingOTP;
  @override
  final bool hasGeneratedOTP;
  @override
  final String? generatedOTP;
  @override
  final Either<VerificationCodeFailure, VerificationCode> userEnteredOTP;
  @override
  final bool hasSubmittedOTP;
  @override
  final UserType userType;
  @override
  final Either<OtherUserTypeFailure, OtherUserType> otherUserType;
  @override
  final bool hasSubmittedUserType;
  final List<bool> _yarnCategorySelected;
  @override
  List<bool> get yarnCategorySelected {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yarnCategorySelected);
  }

  @override
  final Either<NameFailure, Name> firstName;
  @override
  final Either<NameFailure, Name> lastName;
  @override
  final Either<CompanyNameFailure, CompanyName> companyName;
  @override
  final Either<PasswordFailure, Password> password;
  @override
  final bool hasSubmittedUserInformation;
  @override
  final bool isAddingUser;

  @override
  String toString() {
    return 'SignUpState(activeStepIndex: $activeStepIndex, phoneNumber: $phoneNumber, hasSubmittedPhoneNumber: $hasSubmittedPhoneNumber, hasAgreedToTerms: $hasAgreedToTerms, isGeneratingOTP: $isGeneratingOTP, isVerifyingOTP: $isVerifyingOTP, hasGeneratedOTP: $hasGeneratedOTP, generatedOTP: $generatedOTP, userEnteredOTP: $userEnteredOTP, hasSubmittedOTP: $hasSubmittedOTP, userType: $userType, otherUserType: $otherUserType, hasSubmittedUserType: $hasSubmittedUserType, yarnCategorySelected: $yarnCategorySelected, firstName: $firstName, lastName: $lastName, companyName: $companyName, password: $password, hasSubmittedUserInformation: $hasSubmittedUserInformation, isAddingUser: $isAddingUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpState &&
            const DeepCollectionEquality()
                .equals(other.activeStepIndex, activeStepIndex) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(
                other.hasSubmittedPhoneNumber, hasSubmittedPhoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.hasAgreedToTerms, hasAgreedToTerms) &&
            const DeepCollectionEquality()
                .equals(other.isGeneratingOTP, isGeneratingOTP) &&
            const DeepCollectionEquality()
                .equals(other.isVerifyingOTP, isVerifyingOTP) &&
            const DeepCollectionEquality()
                .equals(other.hasGeneratedOTP, hasGeneratedOTP) &&
            const DeepCollectionEquality()
                .equals(other.generatedOTP, generatedOTP) &&
            const DeepCollectionEquality()
                .equals(other.userEnteredOTP, userEnteredOTP) &&
            const DeepCollectionEquality()
                .equals(other.hasSubmittedOTP, hasSubmittedOTP) &&
            const DeepCollectionEquality().equals(other.userType, userType) &&
            const DeepCollectionEquality()
                .equals(other.otherUserType, otherUserType) &&
            const DeepCollectionEquality()
                .equals(other.hasSubmittedUserType, hasSubmittedUserType) &&
            const DeepCollectionEquality()
                .equals(other._yarnCategorySelected, _yarnCategorySelected) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(
                other.hasSubmittedUserInformation,
                hasSubmittedUserInformation) &&
            const DeepCollectionEquality()
                .equals(other.isAddingUser, isAddingUser));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(activeStepIndex),
        const DeepCollectionEquality().hash(phoneNumber),
        const DeepCollectionEquality().hash(hasSubmittedPhoneNumber),
        const DeepCollectionEquality().hash(hasAgreedToTerms),
        const DeepCollectionEquality().hash(isGeneratingOTP),
        const DeepCollectionEquality().hash(isVerifyingOTP),
        const DeepCollectionEquality().hash(hasGeneratedOTP),
        const DeepCollectionEquality().hash(generatedOTP),
        const DeepCollectionEquality().hash(userEnteredOTP),
        const DeepCollectionEquality().hash(hasSubmittedOTP),
        const DeepCollectionEquality().hash(userType),
        const DeepCollectionEquality().hash(otherUserType),
        const DeepCollectionEquality().hash(hasSubmittedUserType),
        const DeepCollectionEquality().hash(_yarnCategorySelected),
        const DeepCollectionEquality().hash(firstName),
        const DeepCollectionEquality().hash(lastName),
        const DeepCollectionEquality().hash(companyName),
        const DeepCollectionEquality().hash(password),
        const DeepCollectionEquality().hash(hasSubmittedUserInformation),
        const DeepCollectionEquality().hash(isAddingUser)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {required final int activeStepIndex,
      required final Either<PhoneNumberFailure, PhoneNumber> phoneNumber,
      required final bool hasSubmittedPhoneNumber,
      required final bool hasAgreedToTerms,
      required final bool isGeneratingOTP,
      required final bool isVerifyingOTP,
      required final bool hasGeneratedOTP,
      final String? generatedOTP,
      required final Either<VerificationCodeFailure, VerificationCode>
          userEnteredOTP,
      required final bool hasSubmittedOTP,
      required final UserType userType,
      required final Either<OtherUserTypeFailure, OtherUserType> otherUserType,
      required final bool hasSubmittedUserType,
      required final List<bool> yarnCategorySelected,
      required final Either<NameFailure, Name> firstName,
      required final Either<NameFailure, Name> lastName,
      required final Either<CompanyNameFailure, CompanyName> companyName,
      required final Either<PasswordFailure, Password> password,
      required final bool hasSubmittedUserInformation,
      required final bool isAddingUser}) = _$_SignUpState;

  @override
  int get activeStepIndex => throw _privateConstructorUsedError;
  @override
  Either<PhoneNumberFailure, PhoneNumber> get phoneNumber =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSubmittedPhoneNumber => throw _privateConstructorUsedError;
  @override
  bool get hasAgreedToTerms => throw _privateConstructorUsedError;
  @override
  bool get isGeneratingOTP => throw _privateConstructorUsedError;
  @override
  bool get isVerifyingOTP => throw _privateConstructorUsedError;
  @override
  bool get hasGeneratedOTP => throw _privateConstructorUsedError;
  @override
  String? get generatedOTP => throw _privateConstructorUsedError;
  @override
  Either<VerificationCodeFailure, VerificationCode> get userEnteredOTP =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSubmittedOTP => throw _privateConstructorUsedError;
  @override
  UserType get userType => throw _privateConstructorUsedError;
  @override
  Either<OtherUserTypeFailure, OtherUserType> get otherUserType =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSubmittedUserType => throw _privateConstructorUsedError;
  @override
  List<bool> get yarnCategorySelected => throw _privateConstructorUsedError;
  @override
  Either<NameFailure, Name> get firstName => throw _privateConstructorUsedError;
  @override
  Either<NameFailure, Name> get lastName => throw _privateConstructorUsedError;
  @override
  Either<CompanyNameFailure, CompanyName> get companyName =>
      throw _privateConstructorUsedError;
  @override
  Either<PasswordFailure, Password> get password =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSubmittedUserInformation => throw _privateConstructorUsedError;
  @override
  bool get isAddingUser => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
