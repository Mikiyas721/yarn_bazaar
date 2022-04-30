import 'package:equatable/equatable.dart';

abstract class ViewModel extends Equatable {}

class EmptyErrorLoadingViewModel<T extends Object> extends ViewModel {
  final String? error;
  final T? data;
  final bool isLoading;
  final bool isEmpty;

  EmptyErrorLoadingViewModel({
    this.error,
    this.data,
    required this.isLoading,
    required this.isEmpty,
  });

  @override
  List get props => [error, data, isLoading, isEmpty];
}

class SimpleListViewModel<T> extends EmptyErrorLoadingViewModel<List<T>> {
  SimpleListViewModel({
    required String? error,
    required List<T>? data,
    required bool isLoading,
  }) : super(
          error: error,
          data: data,
          isLoading: isLoading,
          isEmpty: data == null || data.isEmpty,
        );
}
