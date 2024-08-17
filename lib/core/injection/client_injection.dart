import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/services/api/api_manager.dart';

clientInjection() async {
  sl.registerFactory<ApiManager>(() => ApiManager());
}
