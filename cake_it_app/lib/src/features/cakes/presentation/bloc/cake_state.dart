part of 'cake_bloc.dart';

abstract class CakeListState {}

class CakeListInitial extends CakeListState {}

class CakeListLoading extends CakeListState {}

class CakeListLoaded extends CakeListState {
  final List<CakeModel> cakes;

  CakeListLoaded(this.cakes);
}

class CakeListError extends CakeListState {
  final String message;

  CakeListError(this.message);
}
