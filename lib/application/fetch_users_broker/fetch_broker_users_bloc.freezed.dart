// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_broker_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchBrokerUsersState {
  List<User> get users => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Failure> get error => throw _privateConstructorUsedError;
  int get expandedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchBrokerUsersStateCopyWith<FetchBrokerUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchBrokerUsersStateCopyWith<$Res> {
  factory $FetchBrokerUsersStateCopyWith(FetchBrokerUsersState value,
          $Res Function(FetchBrokerUsersState) then) =
      _$FetchBrokerUsersStateCopyWithImpl<$Res>;
  $Res call(
      {List<User> users,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class _$FetchBrokerUsersStateCopyWithImpl<$Res>
    implements $FetchBrokerUsersStateCopyWith<$Res> {
  _$FetchBrokerUsersStateCopyWithImpl(this._value, this._then);

  final FetchBrokerUsersState _value;
  // ignore: unused_field
  final $Res Function(FetchBrokerUsersState) _then;

  @override
  $Res call({
    Object? users = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? expandedIndex = freezed,
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
      expandedIndex: expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_FetchBrokerUsersStateCopyWith<$Res>
    implements $FetchBrokerUsersStateCopyWith<$Res> {
  factory _$$_FetchBrokerUsersStateCopyWith(_$_FetchBrokerUsersState value,
          $Res Function(_$_FetchBrokerUsersState) then) =
      __$$_FetchBrokerUsersStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<User> users,
      bool isLoading,
      Option<Failure> error,
      int expandedIndex});
}

/// @nodoc
class __$$_FetchBrokerUsersStateCopyWithImpl<$Res>
    extends _$FetchBrokerUsersStateCopyWithImpl<$Res>
    implements _$$_FetchBrokerUsersStateCopyWith<$Res> {
  __$$_FetchBrokerUsersStateCopyWithImpl(_$_FetchBrokerUsersState _value,
      $Res Function(_$_FetchBrokerUsersState) _then)
      : super(_value, (v) => _then(v as _$_FetchBrokerUsersState));

  @override
  _$_FetchBrokerUsersState get _value =>
      super._value as _$_FetchBrokerUsersState;

  @override
  $Res call({
    Object? users = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
    Object? expandedIndex = freezed,
  }) {
    return _then(_$_FetchBrokerUsersState(
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
      expandedIndex: expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchBrokerUsersState implements _FetchBrokerUsersState {
  const _$_FetchBrokerUsersState(
      {required final List<User> users,
      required this.isLoading,
      required this.error,
      required this.expandedIndex})
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
  final int expandedIndex;

  @override
  String toString() {
    return 'FetchBrokerUsersState(users: $users, isLoading: $isLoading, error: $error, expandedIndex: $expandedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchBrokerUsersState &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.expandedIndex, expandedIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(expandedIndex));

  @JsonKey(ignore: true)
  @override
  _$$_FetchBrokerUsersStateCopyWith<_$_FetchBrokerUsersState> get copyWith =>
      __$$_FetchBrokerUsersStateCopyWithImpl<_$_FetchBrokerUsersState>(
          this, _$identity);
}

abstract class _FetchBrokerUsersState implements FetchBrokerUsersState {
  const factory _FetchBrokerUsersState(
      {required final List<User> users,
      required final bool isLoading,
      required final Option<Failure> error,
      required final int expandedIndex}) = _$_FetchBrokerUsersState;

  @override
  List<User> get users => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Failure> get error => throw _privateConstructorUsedError;
  @override
  int get expandedIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FetchBrokerUsersStateCopyWith<_$_FetchBrokerUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}
