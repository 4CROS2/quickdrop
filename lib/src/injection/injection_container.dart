import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quickdrop/src/data/datasource/firebase_login_datasource.dart';
import 'package:quickdrop/src/data/repository/login_repository_impl.dart';
import 'package:quickdrop/src/domain/repository/auth_repository.dart';
import 'package:quickdrop/src/domain/usecase/login_usecase.dart';
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/prensentation/app/cubit/app_observer.dart';
import 'package:quickdrop/src/prensentation/login/cubit/login_cubit.dart';
import 'package:quickdrop/src/prensentation/signup/cubit/signup_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  // Data sources
  sl.registerLazySingleton<FirebaseLoginDatasource>(
    () => FirebaseLoginDatasource(
      firebaseAuth: sl<FirebaseAuth>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );
  sl.registerLazySingleton<AppObserver>(
    () => AppObserver(),
  );
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => ILoginRepository(
      datasource: sl<FirebaseLoginDatasource>(),
    ),
  );
  //use case
  sl.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      repository: sl<AuthRepository>(),
    ),
  );
  //cubits
  sl.registerFactory(
    () => AppCubit(
      firebaseAuth: sl<FirebaseAuth>(),
    ),
  );
  sl.registerFactory(
    () => LoginCubit(
      useCase: sl<AuthUseCase>(),
    ),
  );
  sl.registerFactory(
    () => SignupCubit(
      useCase: sl<AuthUseCase>(),
    ),
  );
}
