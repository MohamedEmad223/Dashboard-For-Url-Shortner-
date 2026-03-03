// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState()';
}


}

/// @nodoc
class $LogoutStateCopyWith<$Res>  {
$LogoutStateCopyWith(LogoutState _, $Res Function(LogoutState) __);
}


/// Adds pattern-matching-related methods to [LogoutState].
extension LogoutStatePatterns on LogoutState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LogOutInitial value)?  initial,TResult Function( LogOutLoading value)?  loading,TResult Function( LogOutSuccess value)?  success,TResult Function( LogOutFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LogOutInitial() when initial != null:
return initial(_that);case LogOutLoading() when loading != null:
return loading(_that);case LogOutSuccess() when success != null:
return success(_that);case LogOutFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LogOutInitial value)  initial,required TResult Function( LogOutLoading value)  loading,required TResult Function( LogOutSuccess value)  success,required TResult Function( LogOutFailure value)  failure,}){
final _that = this;
switch (_that) {
case LogOutInitial():
return initial(_that);case LogOutLoading():
return loading(_that);case LogOutSuccess():
return success(_that);case LogOutFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LogOutInitial value)?  initial,TResult? Function( LogOutLoading value)?  loading,TResult? Function( LogOutSuccess value)?  success,TResult? Function( LogOutFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LogOutInitial() when initial != null:
return initial(_that);case LogOutLoading() when loading != null:
return loading(_that);case LogOutSuccess() when success != null:
return success(_that);case LogOutFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LogOutResponseModel message)?  success,TResult Function( ApiErrorModel error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LogOutInitial() when initial != null:
return initial();case LogOutLoading() when loading != null:
return loading();case LogOutSuccess() when success != null:
return success(_that.message);case LogOutFailure() when failure != null:
return failure(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LogOutResponseModel message)  success,required TResult Function( ApiErrorModel error)  failure,}) {final _that = this;
switch (_that) {
case LogOutInitial():
return initial();case LogOutLoading():
return loading();case LogOutSuccess():
return success(_that.message);case LogOutFailure():
return failure(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LogOutResponseModel message)?  success,TResult? Function( ApiErrorModel error)?  failure,}) {final _that = this;
switch (_that) {
case LogOutInitial() when initial != null:
return initial();case LogOutLoading() when loading != null:
return loading();case LogOutSuccess() when success != null:
return success(_that.message);case LogOutFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class LogOutInitial implements LogoutState {
  const LogOutInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.initial()';
}


}




/// @nodoc


class LogOutLoading implements LogoutState {
  const LogOutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.loading()';
}


}




/// @nodoc


class LogOutSuccess implements LogoutState {
  const LogOutSuccess(this.message);
  

 final  LogOutResponseModel message;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogOutSuccessCopyWith<LogOutSuccess> get copyWith => _$LogOutSuccessCopyWithImpl<LogOutSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LogoutState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $LogOutSuccessCopyWith<$Res> implements $LogoutStateCopyWith<$Res> {
  factory $LogOutSuccessCopyWith(LogOutSuccess value, $Res Function(LogOutSuccess) _then) = _$LogOutSuccessCopyWithImpl;
@useResult
$Res call({
 LogOutResponseModel message
});




}
/// @nodoc
class _$LogOutSuccessCopyWithImpl<$Res>
    implements $LogOutSuccessCopyWith<$Res> {
  _$LogOutSuccessCopyWithImpl(this._self, this._then);

  final LogOutSuccess _self;
  final $Res Function(LogOutSuccess) _then;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LogOutSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as LogOutResponseModel,
  ));
}


}

/// @nodoc


class LogOutFailure implements LogoutState {
  const LogOutFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogOutFailureCopyWith<LogOutFailure> get copyWith => _$LogOutFailureCopyWithImpl<LogOutFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'LogoutState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $LogOutFailureCopyWith<$Res> implements $LogoutStateCopyWith<$Res> {
  factory $LogOutFailureCopyWith(LogOutFailure value, $Res Function(LogOutFailure) _then) = _$LogOutFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$LogOutFailureCopyWithImpl<$Res>
    implements $LogOutFailureCopyWith<$Res> {
  _$LogOutFailureCopyWithImpl(this._self, this._then);

  final LogOutFailure _self;
  final $Res Function(LogOutFailure) _then;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(LogOutFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
