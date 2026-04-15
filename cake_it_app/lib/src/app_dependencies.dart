import 'core/constants/api_constants.dart';
import 'core/network/api_client.dart';
import 'features/cakes/data/repositories/cake_repository.dart';
import 'features/cakes/data/services/cake_service.dart';

class AppDependencies {
  static final apiClient = ApiClient(baseUrl: ApiConstants.baseUrl);
  static final cakeService = CakeService(apiClient);
  static final cakeRepository = CakeRepository(cakeService);
}
