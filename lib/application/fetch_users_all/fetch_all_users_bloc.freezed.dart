// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_all_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchAllUsersState {
  List<User> get users => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchAllUsersStateCopyWith<FetchAllUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchAllUsersStateCopyWith<$Res> {
  factory $FetchAllUsersStateCopyWith(
          FetchAllUsersState value, $Res Function(FetchAllUsersState) then) =
      _$FetchAllUsersStateCopyWithImpl<$Res>;
  $Res call({List<User> users, bool isLoading, Option<Failure> error});
}

/// @nodoc
class _$FetchAllUsersStateCopyWithImpl<$Res>
    implements $FetchAllUsersStateCopyWith<$Res> {
  _$FetchAllUsersStateCopyWithImpl(this._value, this._then);

  final FetchAllUsersState _value;
  // ignore: unused_field
  final $Res Function(FetchAllUsersState) _then;

  @override
  $Res call({
    Object? users = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc
abstract class _$FetchAllUsersStateCopyWith<$Res>
    implements $FetchAllUsersStateCopyWith<$Res> {
  factory _$FetchAllUsersStateCopyWith(
          _FetchAllUsersState value, $Res Function(_FetchAllUsersState) then) =
      __$FetchAllUsersStateCopyWithImpl<$Res>;
  @override
  $Res call({List<User> users, bool isLoading, Option<Failure> error});
}

/// @nodoc
class __$FetchAllUsersStateCopyWithImpl<$Res>
    extends _$FetchAllUsersStateCopyWithImpl<$Res>
    implements _$FetchAllUsersStateCopyWith<$Res> {
  __$FetchAllUsersStateCopyWithImpl(
      _FetchAllUsersState _value, $Res Function(_FetchAllUsersState) _then)
      : super(_value, (v) => _then(v as _FetchAllUsersState));

  @override
  _FetchAllUsersState get _value => super._value as _FetchAllUsersState;

  @override
  $Res call({
    Object? users = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_FetchAllUsersState(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$_FetchAllUsersState implements _FetchAllUsersState {
  const _$_FetchAllUsersState(
      {required final List<User> users,
      required this.isLoading,
      required this.error})
      : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final bool isLoading;
  @override
  final Option<Failure> error;

  @override
  String toString() {
    return 'FetchAllUsersState(users: $users, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchAllUsersState &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$FetchAllUsersStateCopyWith<_FetchAllUsersState> get copyWith =>
      __$FetchAllUsersStateCopyWithImpl<_FetchAllUsersState>(this, _$identity);
}

abstract class _FetchAllUsersState implements FetchAllUsersState {
  const factory _FetchAllUsersState(
      {required final List<User> users,
      required final bool isLoading,
      required final Option<Failure> error}) = _$_FetchAllUsersState;

  @override
  List<User> get users => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Failure> get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FetchAllUsersStateCopyWith<_FetchAllUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}
