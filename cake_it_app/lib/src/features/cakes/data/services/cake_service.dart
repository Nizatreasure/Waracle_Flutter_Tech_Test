import 'package:cake_it_app/src/core/constants/api_constants.dart';

import '../../../../core/network/api_client.dart';
import '../models/cake_model.dart';

class CakeService {
  final ApiClient apiClient;

  CakeService(this.apiClient);

  Future<List<CakeModel>> fetchCakes() async {
    final data = await apiClient.get(ApiConstants.cakeListEndpoint);

    return (data as List).map((json) => CakeModel.fromJson(json)).toList();
  }
}
