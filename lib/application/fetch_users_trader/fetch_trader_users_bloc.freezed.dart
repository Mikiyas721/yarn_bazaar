// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_trader_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchTraderUsersState {
  List<User> get users => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchTraderUsersStateCopyWith<FetchTraderUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchTraderUsersStateCopyWith<$Res> {
  factory $FetchTraderUsersStateCopyWith(FetchTraderUsersState value,
          $Res Function(FetchTraderUsersState) then) =
      _$FetchTraderUsersStateCopyWithImpl<$Res>;
  $Res call({List<User> users, bool isLoading, Option<Failure> error});
}

/// @nodoc
class _$FetchTraderUsersStateCopyWithImpl<$Res>
    implements $FetchTraderUsersStateCopyWith<$Res> {
  _$FetchTraderUsersStateCopyWithImpl(this._value, this._then);

  final FetchTraderUsersState _value;
  // ignore: unused_field
  final $Res Function(FetchTraderUsersState) _then;

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
abstract class _$$_FetchTraderUsersStateCopyWith<$Res>
    implements $FetchTraderUsersStateCopyWith<$Res> {
  factory _$$_FetchTraderUsersStateCopyWith(_$_FetchTraderUsersState value,
          $Res Function(_$_FetchTraderUsersState) then) =
      __$$_FetchTraderUsersStateCopyWithImpl<$Res>;
  @override
  $Res call({List<User> users, bool isLoading, Option<Failure> error});
}

/// @nodoc
class __$$_FetchTraderUsersStateCopyWithImpl<$Res>
    extends _$FetchTraderUsersStateCopyWithImpl<$Res>
    implements _$$_FetchTraderUsersStateCopyWith<$Res> {
  __$$_FetchTraderUsersStateCopyWithImpl(_$_FetchTraderUsersState _value,
      $Res Function(_$_FetchTraderUsersState) _then)
      : super(_value, (v) => _then(v as _$_FetchTraderUsersState));

  @override
  _$_FetchTraderUsersState get _value =>
      super._value as _$_FetchTraderUsersState;

  @override
  $Res call({
    Object? users = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_FetchTraderUsersState(
      users: users == freezed
          ? _value._users
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

class _$_FetchTraderUsersState implements _FetchTraderUsersState {
  const _$_FetchTraderUsersState(
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
    return 'FetchTraderUsersState(users: $users, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchTraderUsersState &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_FetchTraderUsersStateCopyWith<_$_FetchTraderUsersState> get copyWith =>
      __$$_FetchTraderUsersStateCopyWithImpl<_$_FetchTraderUsersState>(
          this, _$identity);
}

abstract class _FetchTraderUsersState implements FetchTraderUsersState {
  const factory _FetchTraderUsersState(
      {required final List<User> users,
      required final bool isLoading,
      required final Option<Failure> error}) = _$_FetchTraderUsersState;

  @override
  List<User> get users => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Failure> get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FetchTraderUsersStateCopyWith<_$_FetchTraderUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}
