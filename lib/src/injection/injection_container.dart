import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quickdrop/src/data/datasource/firebase_login_datasource.dart';
import 'package:quickdrop/src/data/repository/login_repository_impl.dart';
import 'package:quickdrop/src/domain/repository/login_repository.dart';
import 'package:quickdrop/src/domain/usecase/login_usecase.dart';
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/prensentation/login/cubit/login_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  // Data sources
  sl.registerLazySingleton<FirebaseLoginDatasource>(
    () => FirebaseLoginDatasource(
      firebaseAuth: sl<FirebaseAuth>(),
    ),
  );
  // Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => ILoginRepository(
      datasource: sl<FirebaseLoginDatasource>(),
    ),
  );
  //use case
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      repository: sl<LoginRepository>(),
    ),
  );
  //cubits
  sl.registerFactory(() => AppCubit(firebaseAuth:sl<FirebaseAuth>(),),);
  sl.registerFactory(
    () => LoginCubit(
      useCase: sl<LoginUseCase>(),
    ),
  );
}
