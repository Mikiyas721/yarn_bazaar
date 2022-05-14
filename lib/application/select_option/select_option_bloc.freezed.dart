// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'select_option_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectOptionState {
  List<String> get options => throw _privateConstructorUsedError;
  bool get isMultiSelect => throw _privateConstructorUsedError;
  List<bool>? get selectedOptions => throw _privateConstructorUsedError;
  int? get selectedOptionIndex => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectOptionStateCopyWith<SelectOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectOptionStateCopyWith<$Res> {
  factory $SelectOptionStateCopyWith(
          SelectOptionState value, $Res Function(SelectOptionState) then) =
      _$SelectOptionStateCopyWithImpl<$Res>;
  $Res call(
      {List<String> options,
      bool isMultiSelect,
      List<bool>? selectedOptions,
      int? selectedOptionIndex,
      Option<Failure> failure});
}

/// @nodoc
class _$SelectOptionStateCopyWithImpl<$Res>
    implements $SelectOptionStateCopyWith<$Res> {
  _$SelectOptionStateCopyWithImpl(this._value, this._then);

  final SelectOptionState _value;
  // ignore: unused_field
  final $Res Function(SelectOptionState) _then;

  @override
  $Res call({
    Object? options = freezed,
    Object? isMultiSelect = freezed,
    Object? selectedOptions = freezed,
    Object? selectedOptionIndex = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isMultiSelect: isMultiSelect == freezed
          ? _value.isMultiSelect
          : isMultiSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedOptions: selectedOptions == freezed
          ? _value.selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<bool>?,
      selectedOptionIndex: selectedOptionIndex == freezed
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc
abstract class _$$_SelectOptionStateCopyWith<$Res>
    implements $SelectOptionStateCopyWith<$Res> {
  factory _$$_SelectOptionStateCopyWith(_$_SelectOptionState value,
          $Res Function(_$_SelectOptionState) then) =
      __$$_SelectOptionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> options,
      bool isMultiSelect,
      List<bool>? selectedOptions,
      int? selectedOptionIndex,
      Option<Failure> failure});
}

/// @nodoc
class __$$_SelectOptionStateCopyWithImpl<$Res>
    extends _$SelectOptionStateCopyWithImpl<$Res>
    implements _$$_SelectOptionStateCopyWith<$Res> {
  __$$_SelectOptionStateCopyWithImpl(
      _$_SelectOptionState _value, $Res Function(_$_SelectOptionState) _then)
      : super(_value, (v) => _then(v as _$_SelectOptionState));

  @override
  _$_SelectOptionState get _value => super._value as _$_SelectOptionState;

  @override
  $Res call({
    Object? options = freezed,
    Object? isMultiSelect = freezed,
    Object? selectedOptions = freezed,
    Object? selectedOptionIndex = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_SelectOptionState(
      options: options == freezed
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isMultiSelect: isMultiSelect == freezed
          ? _value.isMultiSelect
          : isMultiSelect // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedOptions: selectedOptions == freezed
          ? _value._selectedOptions
          : selectedOptions // ignore: cast_nullable_to_non_nullable
              as List<bool>?,
      selectedOptionIndex: selectedOptionIndex == freezed
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$_SelectOptionState implements _SelectOptionState {
  const _$_SelectOptionState(
      {required final List<String> options,
      required this.isMultiSelect,
      final List<bool>? selectedOptions,
      this.selectedOptionIndex,
      required this.failure})
      : _options = options,
        _selectedOptions = selectedOptions;

  final List<String> _options;
  @override
  List<String> get options {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final bool isMultiSelect;
  final List<bool>? _selectedOptions;
  @override
  List<bool>? get selectedOptions {
    final value = _selectedOptions;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? selectedOptionIndex;
  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'SelectOptionState(options: $options, isMultiSelect: $isMultiSelect, selectedOptions: $selectedOptions, selectedOptionIndex: $selectedOptionIndex, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectOptionState &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality()
                .equals(other.isMultiSelect, isMultiSelect) &&
            const DeepCollectionEquality()
                .equals(other._selectedOptions, _selectedOptions) &&
            const DeepCollectionEquality()
                .equals(other.selectedOptionIndex, selectedOptionIndex) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(isMultiSelect),
      const DeepCollectionEquality().hash(_selectedOptions),
      const DeepCollectionEquality().hash(selectedOptionIndex),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_SelectOptionStateCopyWith<_$_SelectOptionState> get copyWith =>
      __$$_SelectOptionStateCopyWithImpl<_$_SelectOptionState>(
          this, _$identity);
}

abstract class _SelectOptionState implements SelectOptionState {
  const factory _SelectOptionState(
      {required final List<String> options,
      required final bool isMultiSelect,
      final List<bool>? selectedOptions,
      final int? selectedOptionIndex,
      required final Option<Failure> failure}) = _$_SelectOptionState;

  @override
  List<String> get options => throw _privateConstructorUsedError;
  @override
  bool get isMultiSelect => throw _privateConstructorUsedError;
  @override
  List<bool>? get selectedOptions => throw _privateConstructorUsedError;
  @override
  int? get selectedOptionIndex => throw _privateConstructorUsedError;
  @override
  Option<Failure> get failure => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SelectOptionStateCopyWith<_$_SelectOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}
