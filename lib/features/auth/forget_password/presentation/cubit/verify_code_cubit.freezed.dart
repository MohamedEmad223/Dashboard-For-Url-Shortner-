// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyCodeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyCodeState()';
}


}

/// @nodoc
class $VerifyCodeStateCopyWith<$Res>  {
$VerifyCodeStateCopyWith(VerifyCodeState _, $Res Function(VerifyCodeState) __);
}


/// Adds pattern-matching-related methods to [VerifyCodeState].
extension VerifyCodeStatePatterns on VerifyCodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VerifyCodeInitial value)?  initial,TResult Function( VerifyCodeLoading value)?  loading,TResult Function( VerifyCodeSuccess value)?  success,TResult Function( VerifyCodeFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VerifyCodeInitial() when initial != null:
return initial(_that);case VerifyCodeLoading() when loading != null:
return loading(_that);case VerifyCodeSuccess() when success != null:
return success(_that);case VerifyCodeFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VerifyCodeInitial value)  initial,required TResult Function( VerifyCodeLoading value)  loading,required TResult Function( VerifyCodeSuccess value)  success,required TResult Function( VerifyCodeFailure value)  failure,}){
final _that = this;
switch (_that) {
case VerifyCodeInitial():
return initial(_that);case VerifyCodeLoading():
return loading(_that);case VerifyCodeSuccess():
return success(_that);case VerifyCodeFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VerifyCodeInitial value)?  initial,TResult? Function( VerifyCodeLoading value)?  loading,TResult? Function( VerifyCodeSuccess value)?  success,TResult? Function( VerifyCodeFailure value)?  failure,}){
final _that = this;
switch (_that) {
case VerifyCodeInitial() when initial != null:
return initial(_that);case VerifyCodeLoading() when loading != null:
return loading(_that);case VerifyCodeSuccess() when success != null:
return success(_that);case VerifyCodeFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( VerifyCodeResponseModel response)?  success,TResult Function( ApiErrorModel error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VerifyCodeInitial() when initial != null:
return initial();case VerifyCodeLoading() when loading != null:
return loading();case VerifyCodeSuccess() when success != null:
return success(_that.response);case VerifyCodeFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( VerifyCodeResponseModel response)  success,required TResult Function( ApiErrorModel error)  failure,}) {final _that = this;
switch (_that) {
case VerifyCodeInitial():
return initial();case VerifyCodeLoading():
return loading();case VerifyCodeSuccess():
return success(_that.response);case VerifyCodeFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( VerifyCodeResponseModel response)?  success,TResult? Function( ApiErrorModel error)?  failure,}) {final _that = this;
switch (_that) {
case VerifyCodeInitial() when initial != null:
return initial();case VerifyCodeLoading() when loading != null:
return loading();case VerifyCodeSuccess() when success != null:
return success(_that.response);case VerifyCodeFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class VerifyCodeInitial implements VerifyCodeState {
  const VerifyCodeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyCodeState.initial()';
}


}




/// @nodoc


class VerifyCodeLoading implements VerifyCodeState {
  const VerifyCodeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VerifyCodeState.loading()';
}


}




/// @nodoc


class VerifyCodeSuccess implements VerifyCodeState {
  const VerifyCodeSuccess(this.response);
  

 final  VerifyCodeResponseModel response;

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCodeSuccessCopyWith<VerifyCodeSuccess> get copyWith => _$VerifyCodeSuccessCopyWithImpl<VerifyCodeSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'VerifyCodeState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $VerifyCodeSuccessCopyWith<$Res> implements $VerifyCodeStateCopyWith<$Res> {
  factory $VerifyCodeSuccessCopyWith(VerifyCodeSuccess value, $Res Function(VerifyCodeSuccess) _then) = _$VerifyCodeSuccessCopyWithImpl;
@useResult
$Res call({
 VerifyCodeResponseModel response
});




}
/// @nodoc
class _$VerifyCodeSuccessCopyWithImpl<$Res>
    implements $VerifyCodeSuccessCopyWith<$Res> {
  _$VerifyCodeSuccessCopyWithImpl(this._self, this._then);

  final VerifyCodeSuccess _self;
  final $Res Function(VerifyCodeSuccess) _then;

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(VerifyCodeSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as VerifyCodeResponseModel,
  ));
}


}

/// @nodoc


class VerifyCodeFailure implements VerifyCodeState {
  const VerifyCodeFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCodeFailureCopyWith<VerifyCodeFailure> get copyWith => _$VerifyCodeFailureCopyWithImpl<VerifyCodeFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'VerifyCodeState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $VerifyCodeFailureCopyWith<$Res> implements $VerifyCodeStateCopyWith<$Res> {
  factory $VerifyCodeFailureCopyWith(VerifyCodeFailure value, $Res Function(VerifyCodeFailure) _then) = _$VerifyCodeFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$VerifyCodeFailureCopyWithImpl<$Res>
    implements $VerifyCodeFailureCopyWith<$Res> {
  _$VerifyCodeFailureCopyWithImpl(this._self, this._then);

  final VerifyCodeFailure _self;
  final $Res Function(VerifyCodeFailure) _then;

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(VerifyCodeFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
