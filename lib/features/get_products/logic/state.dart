
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class GetProductState<T> with _$GetProductState<T> {
  const factory GetProductState.initial() = _Initial;

  const factory GetProductState.loading() = Loading;
  const factory GetProductState.success(T data) = Success<T>;
  const factory GetProductState.error({required String error}) = Error;
}
