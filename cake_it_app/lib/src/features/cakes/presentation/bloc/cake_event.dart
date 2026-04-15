part of 'cake_bloc.dart';

/// Events related to the cake list, such as loading the cakes
/// from the repository.

abstract class CakeListEvent {}

class LoadCakes extends CakeListEvent {}
