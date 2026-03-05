// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'over_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OverViewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverViewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OverViewState()';
}


}

/// @nodoc
class $OverViewStateCopyWith<$Res>  {
$OverViewStateCopyWith(OverViewState _, $Res Function(OverViewState) __);
}


/// Adds pattern-matching-related methods to [OverViewState].
extension OverViewStatePatterns on OverViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OverViewInitial value)?  initial,TResult Function( OverViewLoading value)?  loading,TResult Function( OverViewSuccess value)?  success,TResult Function( OverViewFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OverViewInitial() when initial != null:
return initial(_that);case OverViewLoading() when loading != null:
return loading(_that);case OverViewSuccess() when success != null:
return success(_that);case OverViewFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OverViewInitial value)  initial,required TResult Function( OverViewLoading value)  loading,required TResult Function( OverViewSuccess value)  success,required TResult Function( OverViewFailure value)  failure,}){
final _that = this;
switch (_that) {
case OverViewInitial():
return initial(_that);case OverViewLoading():
return loading(_that);case OverViewSuccess():
return success(_that);case OverViewFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OverViewInitial value)?  initial,TResult? Function( OverViewLoading value)?  loading,TResult? Function( OverViewSuccess value)?  success,TResult? Function( OverViewFailure value)?  failure,}){
final _that = this;
switch (_that) {
case OverViewInitial() when initial != null:
return initial(_that);case OverViewLoading() when loading != null:
return loading(_that);case OverViewSuccess() when success != null:
return success(_that);case OverViewFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( OverViewResponseModel response)?  success,TResult Function( ApiErrorModel error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OverViewInitial() when initial != null:
return initial();case OverViewLoading() when loading != null:
return loading();case OverViewSuccess() when success != null:
return success(_that.response);case OverViewFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( OverViewResponseModel response)  success,required TResult Function( ApiErrorModel error)  failure,}) {final _that = this;
switch (_that) {
case OverViewInitial():
return initial();case OverViewLoading():
return loading();case OverViewSuccess():
return success(_that.response);case OverViewFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( OverViewResponseModel response)?  success,TResult? Function( ApiErrorModel error)?  failure,}) {final _that = this;
switch (_that) {
case OverViewInitial() when initial != null:
return initial();case OverViewLoading() when loading != null:
return loading();case OverViewSuccess() when success != null:
return success(_that.response);case OverViewFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class OverViewInitial implements OverViewState {
  const OverViewInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverViewInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OverViewState.initial()';
}


}




/// @nodoc


class OverViewLoading implements OverViewState {
  const OverViewLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverViewLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OverViewState.loading()';
}


}




/// @nodoc


class OverViewSuccess implements OverViewState {
  const OverViewSuccess(this.response);
  

 final  OverViewResponseModel response;

/// Create a copy of OverViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverViewSuccessCopyWith<OverViewSuccess> get copyWith => _$OverViewSuccessCopyWithImpl<OverViewSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverViewSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'OverViewState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $OverViewSuccessCopyWith<$Res> implements $OverViewStateCopyWith<$Res> {
  factory $OverViewSuccessCopyWith(OverViewSuccess value, $Res Function(OverViewSuccess) _then) = _$OverViewSuccessCopyWithImpl;
@useResult
$Res call({
 OverViewResponseModel response
});




}
/// @nodoc
class _$OverViewSuccessCopyWithImpl<$Res>
    implements $OverViewSuccessCopyWith<$Res> {
  _$OverViewSuccessCopyWithImpl(this._self, this._then);

  final OverViewSuccess _self;
  final $Res Function(OverViewSuccess) _then;

/// Create a copy of OverViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(OverViewSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as OverViewResponseModel,
  ));
}


}

/// @nodoc


class OverViewFailure implements OverViewState {
  const OverViewFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of OverViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverViewFailureCopyWith<OverViewFailure> get copyWith => _$OverViewFailureCopyWithImpl<OverViewFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverViewFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'OverViewState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $OverViewFailureCopyWith<$Res> implements $OverViewStateCopyWith<$Res> {
  factory $OverViewFailureCopyWith(OverViewFailure value, $Res Function(OverViewFailure) _then) = _$OverViewFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$OverViewFailureCopyWithImpl<$Res>
    implements $OverViewFailureCopyWith<$Res> {
  _$OverViewFailureCopyWithImpl(this._self, this._then);

  final OverViewFailure _self;
  final $Res Function(OverViewFailure) _then;

/// Create a copy of OverViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(OverViewFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
