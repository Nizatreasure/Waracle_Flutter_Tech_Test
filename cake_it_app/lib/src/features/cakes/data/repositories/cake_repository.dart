import '../models/cake_model.dart';
import '../services/cake_service.dart';

/// A repository that abstracts the data fetching logic for cakes.
///
class CakeRepository {
  final CakeService service;

  CakeRepository(this.service);

  Future<List<CakeModel>> fetchCakes() async {
    try {
      return await service.fetchCakes();
    } catch (e) {
      throw Exception('Failed to fetch cakes');
    }
  }
}
