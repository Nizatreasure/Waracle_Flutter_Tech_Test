part of 'cake_bloc.dart';

/// States related to the cake list, such as loading, loaded,
/// and error states.

abstract class CakeListState {}

class CakeListInitial extends CakeListState {}

class CakeListLoading extends CakeListState {}

class CakeListLoaded extends CakeListState {
  final List<CakeModel> cakes;

  CakeListLoaded(this.cakes);
}

class CakeListRefreshing extends CakeListState {
  final List<CakeModel> cakes;

  CakeListRefreshing(this.cakes);
}

class CakeListError extends CakeListState {
  final String message;

  CakeListError(this.message);
}
