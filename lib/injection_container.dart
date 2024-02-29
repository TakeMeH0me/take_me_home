import 'package:get_it/get_it.dart';

import 'package:take_me_home/presentation/router/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => AppRouter());
}
