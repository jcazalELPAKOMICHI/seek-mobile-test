// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() switchDarkMode,
    required TResult Function() switchLightMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? switchDarkMode,
    TResult? Function()? switchLightMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? switchDarkMode,
    TResult Function()? switchLightMode,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchDarkMode value) switchDarkMode,
    required TResult Function(_SwitchLightMode value) switchLightMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SwitchDarkMode value)? switchDarkMode,
    TResult? Function(_SwitchLightMode value)? switchLightMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchDarkMode value)? switchDarkMode,
    TResult Function(_SwitchLightMode value)? switchLightMode,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
    ThemeEvent value,
    $Res Function(ThemeEvent) then,
  ) = _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SwitchDarkModeImplCopyWith<$Res> {
  factory _$$SwitchDarkModeImplCopyWith(
    _$SwitchDarkModeImpl value,
    $Res Function(_$SwitchDarkModeImpl) then,
  ) = __$$SwitchDarkModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchDarkModeImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SwitchDarkModeImpl>
    implements _$$SwitchDarkModeImplCopyWith<$Res> {
  __$$SwitchDarkModeImplCopyWithImpl(
    _$SwitchDarkModeImpl _value,
    $Res Function(_$SwitchDarkModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SwitchDarkModeImpl implements _SwitchDarkMode {
  const _$SwitchDarkModeImpl();

  @override
  String toString() {
    return 'ThemeEvent.switchDarkMode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchDarkModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() switchDarkMode,
    required TResult Function() switchLightMode,
  }) {
    return switchDarkMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? switchDarkMode,
    TResult? Function()? switchLightMode,
  }) {
    return switchDarkMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? switchDarkMode,
    TResult Function()? switchLightMode,
    required TResult orElse(),
  }) {
    if (switchDarkMode != null) {
      return switchDarkMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchDarkMode value) switchDarkMode,
    required TResult Function(_SwitchLightMode value) switchLightMode,
  }) {
    return switchDarkMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SwitchDarkMode value)? switchDarkMode,
    TResult? Function(_SwitchLightMode value)? switchLightMode,
  }) {
    return switchDarkMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchDarkMode value)? switchDarkMode,
    TResult Function(_SwitchLightMode value)? switchLightMode,
    required TResult orElse(),
  }) {
    if (switchDarkMode != null) {
      return switchDarkMode(this);
    }
    return orElse();
  }
}

abstract class _SwitchDarkMode implements ThemeEvent {
  const factory _SwitchDarkMode() = _$SwitchDarkModeImpl;
}

/// @nodoc
abstract class _$$SwitchLightModeImplCopyWith<$Res> {
  factory _$$SwitchLightModeImplCopyWith(
    _$SwitchLightModeImpl value,
    $Res Function(_$SwitchLightModeImpl) then,
  ) = __$$SwitchLightModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchLightModeImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$SwitchLightModeImpl>
    implements _$$SwitchLightModeImplCopyWith<$Res> {
  __$$SwitchLightModeImplCopyWithImpl(
    _$SwitchLightModeImpl _value,
    $Res Function(_$SwitchLightModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SwitchLightModeImpl implements _SwitchLightMode {
  const _$SwitchLightModeImpl();

  @override
  String toString() {
    return 'ThemeEvent.switchLightMode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchLightModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() switchDarkMode,
    required TResult Function() switchLightMode,
  }) {
    return switchLightMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? switchDarkMode,
    TResult? Function()? switchLightMode,
  }) {
    return switchLightMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? switchDarkMode,
    TResult Function()? switchLightMode,
    required TResult orElse(),
  }) {
    if (switchLightMode != null) {
      return switchLightMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SwitchDarkMode value) switchDarkMode,
    required TResult Function(_SwitchLightMode value) switchLightMode,
  }) {
    return switchLightMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SwitchDarkMode value)? switchDarkMode,
    TResult? Function(_SwitchLightMode value)? switchLightMode,
  }) {
    return switchLightMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SwitchDarkMode value)? switchDarkMode,
    TResult Function(_SwitchLightMode value)? switchLightMode,
    required TResult orElse(),
  }) {
    if (switchLightMode != null) {
      return switchLightMode(this);
    }
    return orElse();
  }
}

abstract class _SwitchLightMode implements ThemeEvent {
  const factory _SwitchLightMode() = _$SwitchLightModeImpl;
}

/// @nodoc
mixin _$ThemeState {
  bool get isDarkMode => throw _privateConstructorUsedError;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
    ThemeState value,
    $Res Function(ThemeState) then,
  ) = _$ThemeStateCopyWithImpl<$Res, ThemeState>;
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isDarkMode = null}) {
    return _then(
      _value.copyWith(
            isDarkMode:
                null == isDarkMode
                    ? _value.isDarkMode
                    : isDarkMode // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThemeStateImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$ThemeStateImplCopyWith(
    _$ThemeStateImpl value,
    $Res Function(_$ThemeStateImpl) then,
  ) = __$$ThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode});
}

/// @nodoc
class __$$ThemeStateImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeStateImpl>
    implements _$$ThemeStateImplCopyWith<$Res> {
  __$$ThemeStateImplCopyWithImpl(
    _$ThemeStateImpl _value,
    $Res Function(_$ThemeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isDarkMode = null}) {
    return _then(
      _$ThemeStateImpl(
        isDarkMode:
            null == isDarkMode
                ? _value.isDarkMode
                : isDarkMode // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ThemeStateImpl implements _ThemeState {
  const _$ThemeStateImpl({required this.isDarkMode});

  @override
  final bool isDarkMode;

  @override
  String toString() {
    return 'ThemeState(isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeStateImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkMode);

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      __$$ThemeStateImplCopyWithImpl<_$ThemeStateImpl>(this, _$identity);
}

abstract class _ThemeState implements ThemeState {
  const factory _ThemeState({required final bool isDarkMode}) =
      _$ThemeStateImpl;

  @override
  bool get isDarkMode;

  /// Create a copy of ThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
