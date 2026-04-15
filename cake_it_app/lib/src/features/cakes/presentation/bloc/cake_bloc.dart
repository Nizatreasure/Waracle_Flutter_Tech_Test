import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cake_model.dart';
import '../../data/repositories/cake_repository.dart';
part 'cake_event.dart';
part 'cake_state.dart';

class CakeListBloc extends Bloc<CakeListEvent, CakeListState> {
  final CakeRepository repository;
  CakeListBloc(this.repository) : super(CakeListInitial()) {
    on<LoadCakes>(_onLoadCakes);
  }

  Future<void> _onLoadCakes(
      LoadCakes event, Emitter<CakeListState> emit) async {
    emit(CakeListLoading());

    try {
      final cakes = await repository.fetchCakes();
      emit(CakeListLoaded(cakes));
    } catch (_) {
      emit(CakeListError('Failed to load cakes'));
    }
  }
}
