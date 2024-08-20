import 'package:auhtify/core/injection/auth_injection.dart';
import 'package:auhtify/core/injection/client_injection.dart';
import 'package:get_it/get_it.dart';

import 'files_injection.dart';

final sl = GetIt.instance;

appInjection() async {
  await clientInjection();
  await authInjection();
  await filesInjection();
}
