import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cake_model.dart';
import '../../data/repositories/cake_repository.dart';
part 'cake_event.dart';
part 'cake_state.dart';

/// Bloc that manages the state of the cake list.
class CakeListBloc extends Bloc<CakeListEvent, CakeListState> {
  final CakeRepository repository;
  CakeListBloc(this.repository) : super(CakeListInitial()) {
    on<LoadCakes>(_onLoadCakes);
  }

  Future<void> _onLoadCakes(
      LoadCakes event, Emitter<CakeListState> emit) async {
    final currentState = state;
    if (currentState is CakeListLoaded) {
      emit(CakeListRefreshing(currentState.cakes));
    } else {
      emit(CakeListLoading());
    }
    try {
      final cakes = await repository.fetchCakes();
      emit(CakeListLoaded(cakes));
    } catch (_) {
      if (currentState is CakeListLoaded) {
        emit(CakeListLoaded(currentState.cakes));
      } else {
        emit(CakeListError('Failed to load cakes'));
      }
    }
  }
}
