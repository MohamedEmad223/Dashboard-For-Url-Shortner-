// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgetPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState()';
}


}

/// @nodoc
class $ForgetPasswordStateCopyWith<$Res>  {
$ForgetPasswordStateCopyWith(ForgetPasswordState _, $Res Function(ForgetPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgetPasswordState].
extension ForgetPasswordStatePatterns on ForgetPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgetPasswordInitial value)?  initial,TResult Function( ForgetPasswordLoading value)?  loading,TResult Function( ForgetPasswordSuccess value)?  success,TResult Function( ForgetPasswordFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgetPasswordInitial() when initial != null:
return initial(_that);case ForgetPasswordLoading() when loading != null:
return loading(_that);case ForgetPasswordSuccess() when success != null:
return success(_that);case ForgetPasswordFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgetPasswordInitial value)  initial,required TResult Function( ForgetPasswordLoading value)  loading,required TResult Function( ForgetPasswordSuccess value)  success,required TResult Function( ForgetPasswordFailure value)  failure,}){
final _that = this;
switch (_that) {
case ForgetPasswordInitial():
return initial(_that);case ForgetPasswordLoading():
return loading(_that);case ForgetPasswordSuccess():
return success(_that);case ForgetPasswordFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgetPasswordInitial value)?  initial,TResult? Function( ForgetPasswordLoading value)?  loading,TResult? Function( ForgetPasswordSuccess value)?  success,TResult? Function( ForgetPasswordFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ForgetPasswordInitial() when initial != null:
return initial(_that);case ForgetPasswordLoading() when loading != null:
return loading(_that);case ForgetPasswordSuccess() when success != null:
return success(_that);case ForgetPasswordFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ForgetPasswordResponseModel message)?  success,TResult Function( ApiErrorModel errorMessage)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgetPasswordInitial() when initial != null:
return initial();case ForgetPasswordLoading() when loading != null:
return loading();case ForgetPasswordSuccess() when success != null:
return success(_that.message);case ForgetPasswordFailure() when failure != null:
return failure(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ForgetPasswordResponseModel message)  success,required TResult Function( ApiErrorModel errorMessage)  failure,}) {final _that = this;
switch (_that) {
case ForgetPasswordInitial():
return initial();case ForgetPasswordLoading():
return loading();case ForgetPasswordSuccess():
return success(_that.message);case ForgetPasswordFailure():
return failure(_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ForgetPasswordResponseModel message)?  success,TResult? Function( ApiErrorModel errorMessage)?  failure,}) {final _that = this;
switch (_that) {
case ForgetPasswordInitial() when initial != null:
return initial();case ForgetPasswordLoading() when loading != null:
return loading();case ForgetPasswordSuccess() when success != null:
return success(_that.message);case ForgetPasswordFailure() when failure != null:
return failure(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class ForgetPasswordInitial implements ForgetPasswordState {
  const ForgetPasswordInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.initial()';
}


}




/// @nodoc


class ForgetPasswordLoading implements ForgetPasswordState {
  const ForgetPasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.loading()';
}


}




/// @nodoc


class ForgetPasswordSuccess implements ForgetPasswordState {
  const ForgetPasswordSuccess(this.message);
  

 final  ForgetPasswordResponseModel message;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordSuccessCopyWith<ForgetPasswordSuccess> get copyWith => _$ForgetPasswordSuccessCopyWithImpl<ForgetPasswordSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgetPasswordState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordSuccessCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordSuccessCopyWith(ForgetPasswordSuccess value, $Res Function(ForgetPasswordSuccess) _then) = _$ForgetPasswordSuccessCopyWithImpl;
@useResult
$Res call({
 ForgetPasswordResponseModel message
});




}
/// @nodoc
class _$ForgetPasswordSuccessCopyWithImpl<$Res>
    implements $ForgetPasswordSuccessCopyWith<$Res> {
  _$ForgetPasswordSuccessCopyWithImpl(this._self, this._then);

  final ForgetPasswordSuccess _self;
  final $Res Function(ForgetPasswordSuccess) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ForgetPasswordSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ForgetPasswordResponseModel,
  ));
}


}

/// @nodoc


class ForgetPasswordFailure implements ForgetPasswordState {
  const ForgetPasswordFailure(this.errorMessage);
  

 final  ApiErrorModel errorMessage;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordFailureCopyWith<ForgetPasswordFailure> get copyWith => _$ForgetPasswordFailureCopyWithImpl<ForgetPasswordFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordFailure&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'ForgetPasswordState.failure(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordFailureCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordFailureCopyWith(ForgetPasswordFailure value, $Res Function(ForgetPasswordFailure) _then) = _$ForgetPasswordFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel errorMessage
});




}
/// @nodoc
class _$ForgetPasswordFailureCopyWithImpl<$Res>
    implements $ForgetPasswordFailureCopyWith<$Res> {
  _$ForgetPasswordFailureCopyWithImpl(this._self, this._then);

  final ForgetPasswordFailure _self;
  final $Res Function(ForgetPasswordFailure) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(ForgetPasswordFailure(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
