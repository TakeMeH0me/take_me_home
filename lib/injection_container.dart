import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:take_me_home/core/network/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:take_me_home/data/data_sources/station_remote_data_source.dart';
import 'package:take_me_home/data/repository/station_repository_impl.dart';
import 'package:take_me_home/domain/repository/station_repository.dart';

import 'package:take_me_home/presentation/router/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<StationRepository>(() => StationRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<StationRemoteDataSource>(
      () => StationRemoteDataSourceImpl(
            httpClient: sl(),
          ));

  sl.registerLazySingleton(() => AppRouter());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        connectionChecker: sl(),
      ));

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
