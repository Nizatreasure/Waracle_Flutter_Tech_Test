import 'core/constants/api_constants.dart';
import 'core/network/api_client.dart';
import 'features/cakes/data/repositories/cake_repository.dart';
import 'features/cakes/data/services/cake_service.dart';

/// A class that holds the dependencies for the application, such as the API
/// client, services, and repositories. This allows for easy access to these
/// dependencies throughout the app without having to create multiple
/// instances or pass them down through constructors.
class AppDependencies {
  static final apiClient = ApiClient(baseUrl: ApiConstants.baseUrl);
  static final cakeService = CakeService(apiClient);
  static final cakeRepository = CakeRepository(cakeService);
}
