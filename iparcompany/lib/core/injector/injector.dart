import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:iparcompany/features/authentification/data/data_source/data_source.dart';
import 'package:iparcompany/features/authentification/data/repository/repository.dart';
import 'package:iparcompany/features/authentification/domain/repository/repository.dart';
import 'package:iparcompany/features/authentification/domain/usecase/logout_usecase.dart';
import 'package:iparcompany/features/authentification/domain/usecase/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.I;

Future<void> getInjector() async {
  sl.registerSingletonAsync(() async => FirebaseAuth.instance);
  sl.registerSingletonAsync(
    () async => await SharedPreferences.getInstance(),
  );
  authUseCase();
  logoutUsecase();
}

logoutUsecase() {
  sl.registerFactory(
    () => LogOutUseCase(
      repository: sl(),
    ),
  );
}

authUseCase() {
  sl
    ..registerFactory(() => AuthUseCase(
          repository: sl(),
        ))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
          dataSource: sl(),
        ))
    ..registerLazySingleton(
      () => AuthDataSource(),
    );
}
