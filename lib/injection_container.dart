import 'package:get_it/get_it.dart';

import 'presentation/router/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Routing
  sl.registerLazySingleton(() => AppRouter());
}
